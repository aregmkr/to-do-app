import 'package:flutter/material.dart';
import 'package:trying_learn/styles/style.dart';
import 'package:intl/intl.dart';

class TaskWidget extends StatefulWidget {
  final Map<String, dynamic> task;
  final VoidCallback onDelete;
  final Function(String) onEdit;

  const TaskWidget(
      {super.key,
      required this.task,
      required this.onDelete,
      required this.onEdit});

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  bool isChecked = false;
  TextStyle style_for_text = TextStyle(
    fontSize: 20,
  );

  void _editTask() {
    TextEditingController _controller =
        TextEditingController(text: widget.task['text']);
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
      _focusNode.dispose();
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Checkbox(
            value: widget.task['checked'],
            onChanged: (bool? value) {
              setState(() {
                widget.task['checked'] = value ?? false;
              });
              widget.onEdit(widget.task['text']);
            },
          ),
          Expanded(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    _editTask();
                  },
                  child: Text(
                    widget.task['text'],
                    style: TextStyle(
                      decoration: widget.task['checked']
                          ? TextDecoration.lineThrough
                          : null,
                      decorationColor: Colors.grey,
                      decorationThickness: 2.0,
                      fontSize: 17,
                      color: Theme.of(context).brightness == Brightness.light
                          ? Colors.black
                          : Colors.white,
                    ),
                    softWrap: true,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  DateFormat('d-MM-yyyy').format(DateTime.now()),
                  style: TextStyle(fontSize: 10),
                ),
              ],
            ),
          ),
          // Spacer(),
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
              // Spacer(),
              PopupMenuItem(
                value: 'delete',
                child: Row(
                  children: [
                    Icon(
                      Icons.delete_forever_outlined,
                      color: Colors.red,
                    ),
                    SizedBox(
                      width: 8,
                    ),
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
