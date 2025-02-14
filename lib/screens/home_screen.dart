import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trying_learn/screens/settings_screen.dart';
import 'package:trying_learn/widgets/task_widget.dart';

import '../widgets/task_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> _tasks = [];

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  Future<void> _loadTasks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savedTasks = prefs.getStringList('tasks');

    if (savedTasks != null) {
      setState(() {
        _tasks = savedTasks
            .map((task) => Map<String, dynamic>.from(
            {"text": task.split('|')[0], "checked": task.split('|')[1] == 'true'}))
            .toList();
      });
    }
  }


  Future<void> _saveTasks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> taskStrings =
    _tasks.map((task) => "${task['text']}|${task['checked']}").toList();
    prefs.setStringList('tasks', taskStrings);
  }

  void addTask(String task) {
    setState(() {
      _tasks.add({"text": task, "checked": false});
    });
    _saveTasks();
  }

  void setText(int index, String newTask) {
    setState(() {
      _tasks[index]['text'] = newTask;
    });
    _saveTasks();
  }

  void deleteTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
    _saveTasks();
  }

  void showAddDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context)
        {
          return TaskDialog(
          onAddTask: addTask,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To-Do List"),
      ),
      body: ListView.builder(
          padding: EdgeInsets.all(20.0),
          itemCount: _tasks.length,
          itemBuilder: (BuildContext context, int index) {
            return TaskWidget(
              task: _tasks[index],
              onDelete: () => deleteTask(index),
              onEdit: (newTask) => setText(index, newTask),
            );
          },
      ),
    );
  }
}
