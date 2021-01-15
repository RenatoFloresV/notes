import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/screens/todo_list_screen.dart';

class HomeTodo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body: SizedBox(
      child: DraggableScrollableSheet(
          builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          color: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30.0)),
              color: Colors.red[200],
            ),
            child: ListView.builder(
                controller: scrollController,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text('Item $index'),
                  );
                }),
          ),
        );
      }),
    )));
  }
}





