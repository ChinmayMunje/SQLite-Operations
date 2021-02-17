import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {

  final bool isChecked;
  final String taskTitle;
  final Function checkboxCallback;
  final Function onLongPressCallback;


  TaskTile({this.isChecked, this.taskTitle, this.checkboxCallback, this.onLongPressCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: onLongPressCallback,
      title: Text(taskTitle ?? 'default value' ,style: TextStyle(
        decoration: isChecked ? TextDecoration.lineThrough : null
      ),
      ),
      trailing: Checkbox(
        value: isChecked,
        onChanged: (newValue) {
          checkboxCallback(newValue);
        },
      ),
    );
  }
}





