import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/data_provider.dart';

class TaskTile extends StatelessWidget {

  final bool isChecked;
  final String taskTitle;
  final void Function(bool) checkboxCallback;
  final void Function() deleteTaskCallback;

  TaskTile({required this.isChecked, required this.taskTitle, required this.checkboxCallback, required this.deleteTaskCallback});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: deleteTaskCallback,
      child: ListTile(
        title: Text(
          taskTitle,
          style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Checkbox(
          activeColor: Colors.lightBlueAccent,
          value: isChecked,
          onChanged:(value){
            checkboxCallback!(isChecked);
          },
        ),

      ),
    );
  }
}
