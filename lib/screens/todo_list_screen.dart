import 'package:flutter/material.dart';
import 'package:notes_app/helpers/database_helper.dart';
import 'package:notes_app/models/notes_models.dart';
import 'package:notes_app/screens/add_new_note_screen.dart';

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  Future<List<Note>> _noteList;

  @override
  void initState() {
    super.initState();
    _updateNoteList();
  }

  _updateNoteList() {
    setState(() {
      _noteList = DatabaseHelper.instance.getNoteList();
    });
  }

  Widget _buildNote(Note note) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        children: [
          ListTile(
            title: Text(
              note.title,
              style: TextStyle(
                  fontSize: 18.0,
                  decoration: note.status == 0
                      ? TextDecoration.none
                      : TextDecoration.lineThrough),
            ),
            subtitle: Text(note.content),
            //trailing: Checkbox(
            //onChanged: (value) {
            //note.status = value == 1 ? true : false;
            //DatabaseHelper.instance.updateNote(note);
            //_updateNoteList();
            //},
            //value: true),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => AddNewNote(
                        updateNoteList: _updateNoteList, note: note))),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: _noteList,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              //final int completedNoteCount = snapshot.data
              // .where((Note note) => note.status == 1)
              //.toList()
              //.length;

              return ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 30.0),
                itemCount: 1 + snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 20.0),
                      child: Row(children: [
                        Text(
                          "My Notes",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => AddNewNote(
                                        updateNoteList: _updateNoteList,
                                      )),
                            );
                          },
                          color: Colors.white,
                          textColor: Colors.black,
                          child:
                              Text('New Note', style: TextStyle(fontSize: 20)),
                        ),

                        //SizedBox(height: 10.0),
                        //Text("$completedNoteCount of ${snapshot.data.length}"),
                      ]),
                    );
                  }
                  return _buildNote(snapshot.data[index - 1]);
                },
              );
            }));
  }
}
