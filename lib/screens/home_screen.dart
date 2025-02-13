import 'package:flutter/material.dart';
import 'package:trying_learn/screens/settings_screen.dart';
import 'package:trying_learn/widgets/task_widget.dart';

import '../widgets/task_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> _tasks = [];

  void addTask(String task) {
    setState(() {
      _tasks.add(task);
    });
  }

  void setText(int index, String newTask) {
    setState(() {
      _tasks[index] = newTask;
    });
  }

  void deleteTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  void _showAddDialog() {
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
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingsScreen()));
              },
              icon: Icon(Icons.settings))
        ],
      ),
      body: ListView.builder(
          padding: EdgeInsets.all(20.0),
          itemCount: _tasks.length,
          itemBuilder: (BuildContext context, int index) {
            return TaskWidget(
              task_text: _tasks[index],
              onDelete: () => deleteTask(index),
              onEdit: (newTask) => setText(index, newTask),
            );
          },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddDialog();
        },
        child: Icon(Icons.add, color: Colors.black,),
      ),

      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
