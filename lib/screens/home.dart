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

//void _showAlert() {
AlertDialog dialog = new AlertDialog(
  content: new Container(
    width: 260.0,
    height: 230.0,
    decoration: new BoxDecoration(
      shape: BoxShape.rectangle,
      color: const Color(0xFFFFFF),
      borderRadius: new BorderRadius.all(new Radius.circular(32.0)),
    ),
    child: new Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        // dialog top
        new Expanded(
          child: new Row(
            children: <Widget>[
              new Container(
                // padding: new EdgeInsets.all(10.0),
                decoration: new BoxDecoration(
                  color: Colors.white,
                ),
                child: new Text(
                  'Rate',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontFamily: 'helvetica_neue_light',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),

        // dialog centre
        new Expanded(
          child: new Container(
              child: new TextField(
            decoration: new InputDecoration(
              border: InputBorder.none,
              filled: false,
              contentPadding: new EdgeInsets.only(
                  left: 10.0, top: 10.0, bottom: 10.0, right: 10.0),
              hintText: ' add review',
              hintStyle: new TextStyle(
                color: Colors.grey.shade500,
                fontSize: 12.0,
                fontFamily: 'helvetica_neue_light',
              ),
            ),
          )),
          flex: 2,
        ),

        // dialog bottom
        new Expanded(
          child: new Container(
            padding: new EdgeInsets.all(16.0),
            decoration: new BoxDecoration(
              color: const Color(0xFF33b17c),
            ),
            child: new Text(
              'Rate product',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontFamily: 'helvetica_neue_light',
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    ),
  ),
);





