import 'package:flutter/material.dart';
import 'package:notes_app/screens/todo_list_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Notes',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: TodoListScreen(),
    );
  }
}