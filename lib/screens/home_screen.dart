import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_getx/controllers/todo_controller.dart';
import 'package:todo_getx/models/todo.dart';
import 'package:todo_getx/screens/secondpage.dart';
import 'package:intl/intl.dart';
import 'package:todo_getx/screens/todo_form.dart';
 DateTime datetime = DateTime.now();
String datetime2 = DateFormat.Hms().format(datetime);
dynamic currentTime = DateFormat.jm().format(DateTime.now());

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
  
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final todoControllerP = Get.find<TodoController>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo App using getx"),
        backgroundColor: Colors.amberAccent,
        

      ),
      // ignore: avoid_print
    
      body: 
          GetBuilder(
            builder: (TodoController todoController) {
              return ListView.builder(
                itemCount: todoController.todos.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      //TODO:to update todo
                       
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return TodoForm(
                            type: "update",
                            todo: todoController.todos[index],
                          );
                        },
                      );
                    },
                    
                    title: Text(
                      todoController.todos[index].description,
                   
                     
                    ),
                    // ignore: avoid_print
                    leading: Text( currentTime.toString()),
              
                    trailing: IconButton(
                      onPressed: () {
                        todoController.deleteTodo(todoController.todos[index].id);
                      },
                      icon: Icon(Icons.delete),
                    ),
                  );
                },
              );
            },
          ),
          
        
      
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          Navigator.push(context,MaterialPageRoute(
            builder: (context)=>Second())
            );
         
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

