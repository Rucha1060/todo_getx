import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_getx/controllers/todo_controller.dart';
import 'package:todo_getx/models/todo.dart';
import 'package:todo_getx/conrollers/todo_controller.dart';
import 'package:todo_getx/screens/todo_form.dart';


class Second extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SecondState();
    throw UnimplementedError();
  }

  
}

class _SecondState extends State <Second>
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
       appBar: AppBar(
        title: Text("Todo App using getx page 2"),
        backgroundColor: Colors.purpleAccent,
        
    ),
    body:TodoForm(type: "new",todo: Todo(description:"" )),);
   
    throw UnimplementedError();
  }

}

