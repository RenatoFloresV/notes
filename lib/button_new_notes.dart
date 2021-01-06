import 'package:flutter/material.dart';
import 'package:notes_app/screens/add_new_note.dart';

class ButtonNewNote extends StatefulWidget {
  ButtonNewNote({Key key}) : super(key: key);

  @override
  _ButtonNewNote createState() => _ButtonNewNote();
}

class _ButtonNewNote extends State<ButtonNewNote> {
  @override
  Widget build(BuildContext context) {
    return Column(
      
      children: <Widget>[
        RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.0),
          ),
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => AddNewNote())),
          color: Colors.white,
          textColor: Colors.black,
          child: Text("New Note", style: TextStyle(fontSize: 20)),
        ),
      ],
    );
  }
}
