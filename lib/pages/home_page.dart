import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:todoapplication/pages/utility/dialog_box.dart';
import 'package:todoapplication/pages/utility/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  // Text controller for the input field
  final TextEditingController _controller = TextEditingController();

  // List of to-do tasks
  List toDoList = [
    ['Make tutorial', false],
    ['Do Exercise', false],
  ];

  // Function to handle checkbox changes
  void onChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = value!;
    });
  }

  // Save a new task
  void saveNewTask() {
    setState(() {
      toDoList.add([_controller.text, false]); // Add the new task
      _controller.clear(); // Clear the input field
    });
    Navigator.of(context).pop(); // Close the dialog box
  }

  // Create a new task dialog
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSaved: saveNewTask,
          onCancel: Navigator.of(context).pop,
        );
      },
    );
  }
//delete task
  void deleteTask(int index){
    setState(() {
      toDoList.removeAt(index);

    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent[100],
      appBar: AppBar(
        elevation: 0,
        title: const Text('TO DO'),
        centerTitle: true,
        backgroundColor: Colors.yellow,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: createNewTask,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: toDoList[index][0], // Get the task name
            taskCompleted: toDoList[index][1], // Get completion status
            onChanged: (value) {
              onChanged(value, index); // Handle the checkbox change
            }, deleteFunction: (context)=> deleteTask(index),
          );
        },
      ),
    );
  }
}
