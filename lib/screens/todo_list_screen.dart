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
    //return container with new note

    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Theme.of(context).dividerColor))),
            child: ListTile(
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
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        body: Stack(children: [
      Container(
        color: Colors.blueGrey[900],
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all( 10.0),
            child: Text('ChangeMaker',
                style: TextStyle(fontSize: 50, color: Colors.white),
                
                textAlign: TextAlign.center),
          ),
          Container(
            height: 400,
            decoration: BoxDecoration(
                image:
                    DecorationImage(image: AssetImage('lib/assets/home.jpg'))),
          ),
        ]),
      ),
FutureBuilder(
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

                  return DraggableScrollableSheet(
                    builder: (BuildContext context, ScrollController scrollController){
                                      return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30.0),
                            topLeft: Radius.circular(30.0)),
                        color: Colors.white,
                      ),
                      child: ListView.builder(
                        controller: scrollController,
                        padding: EdgeInsets.only(top: 0.0),
                        itemCount: 1 + snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          if (index == 0) {
                            // return Appbar My notes and button New note
                            return Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(30.0),
                                        topLeft: Radius.circular(30.0)),
                                    color: Colors.blueGrey[900],
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 25.0, vertical: 20.0),
                                  child: Row(children: [
                                    Text(
                                      "My Notes",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 25.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Spacer(),
                                    RaisedButton(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30.0),
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => AddNewNote(
                                                    updateNoteList:
                                                        _updateNoteList,
                                                  )),
                                        );
                                      },
                                      color: Colors.white,
                                      textColor: Colors.black,
                                      child: Text('New Note',
                                          style: TextStyle(fontSize: 14)),
                                    ),

                                    //SizedBox(height: 10.0),
                                    //Text("$completedNoteCount of ${snapshot.data.length}"),
                                  ]),
                                ),
                              ],
                            );
                          }
                          return (_buildNote(snapshot.data[index - 1]));
                        },
                      ),
                    );
                    }
                  
                  
                  );
                })
          
          
    ]));
  }
}
