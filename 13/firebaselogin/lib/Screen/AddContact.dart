import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:io';
import '../model/contact.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

class AddContact extends StatefulWidget {
  @override
  _AddContactState createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  DatabaseReference _databaseReference = FirebaseDatabase.instance.reference();

  String _firstname = '';
  String _lastname = '';
  String _address = '';
  String _phone = '';
  String _email = '';
  String _photoUrl = '';

  saveContact(BuildContext context) async {
    if (_firstname.isNotEmpty &&
        _lastname.isNotEmpty &&
        _phone.isNotEmpty &&
        _email.isNotEmpty &&
        _address.isNotEmpty) {
      Contact contact = Contact(this._firstname, this._lastname, this._phone,
          this._email, this._address, this._photoUrl);
      await _databaseReference.push().set(contact.toJson());
      navigateToLastScreen(context);
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Field Required"),
              content: Text("All fields are required"),
              actions: <Widget>[
                FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Close"))
              ],
            );
          });
    }
  }

  Future pickImage() async {
    File file = await ImagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 200.0, maxWidth: 200.0);
    String filename = basename(file.path);
    uploadImage(file, filename);
  }

  void uploadImage(File file, String filename) async {
    StorageReference _storageReference =
        FirebaseStorage.instance.ref().child(filename);
    _storageReference.putFile(file).onComplete.then((firebaseFile) async {
      var downloadUrl = await firebaseFile.ref.getDownloadURL();

      setState(() {
        _photoUrl = downloadUrl;
      });
    });
  }

  navigateToLastScreen(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add Contact"),
        ),
        body: Container(
            child: Padding(
                padding: EdgeInsets.all(20.0),
                child: ListView(
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(top: 20.0),
                        child: GestureDetector(
                            onTap: () {
                              this.pickImage();
                            },
                            child: Center(
                                child: Container(
                                    width: 100.0,
                                    height: 100.0,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: _photoUrl == "empty"
                                              ? AssetImage("assets/logo.png")
                                              : NetworkImage(_photoUrl),
                                        )))))),
                    Container(
                        margin: EdgeInsets.only(top: 20.0),
                        child: TextField(
                          onChanged: (value) {
                            setState(() {
                              _firstname = value;
                            });
                          },
                          decoration: InputDecoration(
                              labelText: 'First Name',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              )),
                        )),
                    Container(
                        margin: EdgeInsets.only(top: 20.0),
                        child: TextField(
                          onChanged: (value) {
                            setState(() {
                              _lastname = value;
                            });
                          },
                          decoration: InputDecoration(
                              labelText: 'Last Name',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              )),
                        )),
                    Container(
                        margin: EdgeInsets.only(top: 20.0),
                        child: TextField(
                          onChanged: (value) {
                            setState(() {
                              _lastname = value;
                            });
                          },
                          decoration: InputDecoration(
                              labelText: 'Last Name',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              )),
                        )),
                    Container(
                        margin: EdgeInsets.only(top: 20.0),
                        child: TextField(
                          onChanged: (value) {
                            setState(() {
                              _lastname = value;
                            });
                          },
                          decoration: InputDecoration(
                              labelText: 'Last Name',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              )),
                        )),
                    Container(
                        margin: EdgeInsets.only(top: 20.0),
                        child: TextField(
                          onChanged: (value) {
                            setState(() {
                              _phone = value;
                            });
                          },
                          decoration: InputDecoration(
                              labelText: 'Phone',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              )),
                        )),
                    Container(
                      margin: EdgeInsets.only(top: 20.0),
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            _email = value;
                          });
                        },
                        decoration: InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            )),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20.0),
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            _address = value;
                          });
                        },
                        decoration: InputDecoration(
                            labelText: 'Address',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            )),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.only(top: 20.0),
                        child: RaisedButton(
                            padding: EdgeInsets.fromLTRB(100, 20, 100, 20),
                            onPressed: () {
                              saveContact(context);
                            },
                            color: Colors.red,
                            child: Text(
                              "Save",
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.red,
                              ),
                            )))
                  ],
                ))));
  }
}
