import 'package:flutter/material.dart';

class AddNewNote extends StatefulWidget {
  AddNewNote({Key key}) : super(key: key);

  @override
  _AddNewNoteState createState() => _AddNewNoteState();
}

class _AddNewNoteState extends State<AddNewNote> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
            body: Column(children: [
      GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Icon(
          Icons.arrow_back_ios,
          size: 30.0,
          color: Theme.of(context).primaryColor,
        ),
      ),
      SizedBox(
        height: 20.0,
      ),
      Text(
        "Add Note",
        style: TextStyle(
            color: Colors.black, fontSize: 25.0, fontWeight: FontWeight.bold),
      )
    ])));
  }
}
