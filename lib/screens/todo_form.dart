import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_getx/controllers/todo_controller.dart';
import 'package:todo_getx/models/todo.dart';
import 'package:todo_getx/screens/home_screen.dart';

class TodoForm extends StatefulWidget {
  final String type;
  final Todo todo;

  const TodoForm({Key? key, required this.type,  required this.todo}) : super(key: key);
  @override
  _TodoFormState createState() => _TodoFormState();
}

class _TodoFormState extends State<TodoForm> {
  final _formKey = GlobalKey<FormState>();
  late String description;
  @override
  Widget build(BuildContext context) {
    final todoController = Get.find<TodoController>();
    var homeScreen = HomeScreen;
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              initialValue: widget.todo != null ? widget.todo.description : '',
              onSaved: (value) => description = value!,
              decoration: InputDecoration(
                hintText: "Add Description",
              ),
            ),
          SizedBox(height: 40,width: 50,),
            FlatButton(
              color: Colors.blue,
              onPressed: () {
                _formKey.currentState?.save();
                if (widget.type == "new") {
                  todoController.addTodo(Todo(description: description));
                } else {
                  todoController.updateTodo(widget.todo, description);
                }
                Navigator.of(context).pop();
              },
              child: Text(
                widget.todo != null ? "Update" : "Add",
                
                   
              ),
            ),
          
          ],
        ),
      ),
    );
  }
}