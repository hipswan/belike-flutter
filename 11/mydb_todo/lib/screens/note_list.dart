import 'package:flutter/material.dart';

import 'dart:async';
import '../database_helper.dart';
import 'note_details.dart';
import 'package:sqflite/sqflite.dart';
import 'package:mydb_todo/Note.dart';

class NoteList extends StatefulWidget {
  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Note> noteList;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    if (noteList ==  null) {
      noteList = List<Note>();
      updateListView();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('My ToDO App'),
        backgroundColor: Colors.purple,
      ),
      body: ListView.builder(
        itemCount: count,
        itemBuilder: (context, position) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            color: Colors.deepPurple,
            elevation: 4.0,
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage:
                    NetworkImage("https://learncodeonline.in/mascot.png"),
              ),
              title: Text(
                this.noteList[position].title,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                ),
              ),
              subtitle: Text(
                this.noteList[position].date,
                style: TextStyle(color: Colors.white),
              ),
              trailing: GestureDetector(
                child: Icon(Icons.open_in_new, color: Colors.white),
                onTap: () {
                  navigateToDetail(this.noteList[position], 'Edit Todo');
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        child: Icon(Icons.add),
        onPressed: () {
          navigateToDetail(Note('', '', 2), 'Add Note');
        },
      ),
    );
  }

  void navigateToDetail(Note note, String title) async {
    bool result =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return NoteDetail(note, title);
    }));

    if (result == true) {
      updateListView();
    }
  }

  void updateListView() {
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database) {
      Future<List<Note>> noteListFuture = databaseHelper.getNoteList();
      noteListFuture.then((noteList) {
        setState(() {
          this.noteList = noteList;
          this.count = noteList.length;
        });
      });
    });
  }
}
