import 'package:flutter/material.dart';
import 'package:notes_app/screens/home.dart';

import 'package:notes_app/screens/todo_list_screen.dart';

import 'screens/todo_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Notes',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: Pagina(),
    );
  }
}
