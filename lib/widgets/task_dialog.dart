import 'package:flutter/material.dart';

class TaskDialog extends StatelessWidget {
  final Function(String) onAddTask;

  const TaskDialog({super.key, required this.onAddTask});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();
    return AlertDialog(
      title: Text("Add a Task"),
      content: TextField(
        controller: _controller,
        decoration: InputDecoration(hintText: "Enter your task"),
      ),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Cancel")
        ),
        TextButton(
            onPressed: () {
              if (_controller.text.isNotEmpty) {
                onAddTask(_controller.text);
              }
              Navigator.of(context).pop();
            },
            child: Text("Add"),
        )
      ],
    );
  }
}
