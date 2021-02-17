import 'package:flutter/material.dart';
import 'package:todo_list_flutter_app/Modal/TaskData.dart';
import 'package:todo_list_flutter_app/Widgets/TaskTile.dart';
import 'package:provider/provider.dart';

class TasksList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder
          (
          itemBuilder: (context, index){
          final task = taskData.tasks[index];
          return TaskTile(taskTitle: task.name,
            isChecked: task.isDone,
            checkboxCallback:(bool checkboxState) {
            taskData.updateTask(task);
            },
            onLongPressCallback: (){
            taskData.delete(task);

            },
          );

        },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
