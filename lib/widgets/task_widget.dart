import 'package:flutter/material.dart';
import 'package:trying_learn/styles/style.dart';

class TaskWidget extends StatefulWidget {
  final String task_text;
  final VoidCallback onDelete;
  final Function(String) onEdit;
  const TaskWidget({super.key,
                  required this.task_text,
                  required this.onDelete,
                  required this.onEdit});

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  bool isChecked = false;
  TextStyle style_for_text = TextStyle(
      fontSize: 20,
      color: Colors.black
  );

  void _editTask() {
    TextEditingController _controller = TextEditingController(text: widget.task_text);
    FocusNode _focusNode = FocusNode();
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Edit task"),
            content: TextField(
              controller: _controller,
              focusNode: _focusNode,
              decoration: InputDecoration(hintText: "Enter new task"),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancel"),
              ),
              TextButton(
                  onPressed: () {
                    widget.onEdit(_controller.text);
                    Navigator.pop(context);
                  },
                  child: Text("Save"),
              )
            ],
          );
        },
    ).then((_) {
      _focusNode.dispose(); // Clean up the focus node
    });

    // Ensure the focus is requested only after the dialog has fully built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container (
      width: 200,
      child: Row(
        children: [
          Checkbox(
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value ?? false;
                });
              },
          ),
          Text(widget.task_text, style: TextStyle(
              decoration: isChecked ? TextDecoration.lineThrough : null,
              decorationColor: Colors.grey,
              decorationThickness: 2.0,
              fontSize: 20,
              color: Colors.black
          ), ),
          Spacer(),
          PopupMenuButton<String>(
              onSelected: (value) {
                if (value == 'edit') {
                  _editTask();
                } else if (value == 'delete') {
                  widget.onDelete();
                }
              },
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 'edit',
                  child: Row(
                    children: [
                      Icon(Icons.edit, color: Colors.blue),
                      SizedBox(width: 8),
                      Text("Edit"),
                    ],
                  ),
                ),
              PopupMenuItem(
                value: 'delete',
                child: Row(
                  children: [
                    Icon(Icons.delete_forever_outlined, color: Colors.red,),
                    SizedBox(width: 8,),
                    Text("Delete"),
                  ],
                ),
              )
              ],
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
    );
  }
}
