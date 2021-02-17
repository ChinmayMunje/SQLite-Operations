import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_flutter_app/Modal/TaskData.dart';
import 'package:provider/provider.dart';


class AddTaskScreen extends StatefulWidget {

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {

  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


    String newTaskTitle;

    return Container(
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.lightBlue[100],
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            topLeft: Radius.circular(20.0),
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Add Task',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30.0,
            color: Colors.indigo[700],
          ),
          ),
          TextField(
            autofocus: true,
            controller: myController,
            textAlign: TextAlign.center,
            onChanged: (newText){
              setState(() {
                newTaskTitle = newText.toString();
              });

            },
          ),
          SizedBox(height: 8.0),

          FlatButton(
            padding: EdgeInsets.all(10.0),
            onPressed: (){

              setState(() {
                Provider.of<TaskData>(context,listen: false).addTask(myController.text);
                print(myController.text);
                Navigator.pop(context);

              });

            },
            color: Colors.indigo[700],
            child: Text('ADD',
            style: TextStyle(
              color: Colors.lightBlue[100],
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
            ),
            ),
          ),
        ],
      ),
    );
  }
}
