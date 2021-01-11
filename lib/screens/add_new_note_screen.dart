import 'package:flutter/material.dart';
import 'package:notes_app/helpers/database_helper.dart';
import 'package:notes_app/models/notes_models.dart';

class AddNewNote extends StatefulWidget {
  final Function updateNoteList;
  final Note note;

  AddNewNote({this.updateNoteList, this.note});

  @override
  _AddNewNote createState() => _AddNewNote();
}

class _AddNewNote extends State<AddNewNote> {
  final _formKey = GlobalKey<FormState>();
  String _title = '';
  String _content = '';

  @override
  void initState() {
    super.initState();

    if (widget.note != null) {
      _title = widget.note.title;
      _content = widget.note.content;
    }
  }

  _delete() {
    DatabaseHelper.instance.deleteNote(widget.note.id);
    widget.updateNoteList();
    Navigator.pop(context);
  }

  _save() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      print('$_title, $_content');

      Note note = Note(title: _title, content: _content);
      if (widget.note == null) {
        // Insert the note to our user`s database
        note.status = 0;
        DatabaseHelper.instance.insertNote(note);
      } else {
        // Update the note
        note.id = widget.note.id;
        note.status = widget.note.status;
        DatabaseHelper.instance.updateNote(note);
      }

      widget.updateNoteList();

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SingleChildScrollView(
                child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 40.0, vertical: 80.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Icon(Icons.arrow_back_ios),
                          ),
                          SizedBox(height: 20.0),
                          Text("New note",
                              style: TextStyle(
                                  color: Colors.black, fontSize: 40.0)),
                          SizedBox(height: 10.0),
                          Form(
                            key: _formKey,
                            child: Column(children: [
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 20.0),
                                child: TextFormField(
                                  style: TextStyle(fontSize: 18.0),
                                  decoration: InputDecoration(
                                      labelText: "Title",
                                      labelStyle: TextStyle(fontSize: 18.0),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      )),
                                  validator: (input) => input.trim().isEmpty
                                      ? "Please enter a note title"
                                      : null,
                                  onSaved: (input) => _title = input,
                                  initialValue: _title,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 20.0),
                                child: TextFormField(
                                  style: TextStyle(fontSize: 18.0),
                                  decoration: InputDecoration(
                                      labelText: "Content",
                                      labelStyle: TextStyle(fontSize: 18.0),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      )),
                                  validator: (input) => input.trim().isEmpty
                                      ? "Please enter a content"
                                      : null,
                                  onSaved: (input) => _content = input,
                                  initialValue: _content,
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.symmetric(vertical: 20.0),
                                  height: 60.0,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  child: FlatButton(
                                      child: Text(widget.note == null ? 'Add' : 'Update',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.0)),
                                      onPressed: _save)
                                      ),
                              widget.note != null
                          ? Container(
                            margin: EdgeInsets.symmetric(vertical: 20.0),
                                  height: 60.0,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  child: FlatButton(
                                      child: Text('Delete',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.0)),
                                      onPressed: _delete)
                          )
                          : SizedBox.shrink()
                                  
                            ],
                            ),
                            ),
                          
                        ],
                        ),
                        ),
                        ),
                        ),
                        );
  }
}
