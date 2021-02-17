import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_flutter_app/Modal/TaskData.dart';
import 'package:todo_list_flutter_app/Screens/AddTaskScreen.dart';
import 'package:todo_list_flutter_app/Widgets/TasksList.dart';

class TaskScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[700],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.lightBlue[100],
                    child: Icon(Icons.list, color: Colors.indigo[700], size: 30.0),
                  radius: 30.0,
                ),
                SizedBox(height: 5.0),
                Text('Today',
                style: TextStyle(
                   color: Colors.lightBlue[100],
                  fontWeight: FontWeight.w600,
                  fontSize: 50.0,
                ),
                ),
                Text('${Provider.of<TaskData>(context).taskCount} Tasks',
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.lightBlue[100],
                ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: Colors.lightBlue[100],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: TasksList(),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor:  Colors.indigo[700],
        child: Icon(Icons.add, color: Colors.lightBlue[100]),
        onPressed: (){
          showModalBottomSheet(
              context: context,
              builder: (context) => SingleChildScrollView (
                child: Container(
                  padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: AddTaskScreen(),
                ),
              ),
          );
        },
      ),
    );
  }
}


