import 'package:flutter/material.dart';
import 'HomePage.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  GlobalKey<FormState> _key = new GlobalKey();
  bool _autovalidate = false; //default : once it gone through validation it will change the validate()
  String name, email, password, collegename;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow,
        appBar: AppBar(
          title: Text('SignUp'),
        ),
        body: SingleChildScrollView(
          child: Form(
              key: _key,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10.0),
                    ),
                    Image(
                      image: AssetImage("images/logo.png"),
                      width: 100.0,
                      height: 100.0,
                    ),
                    ListTile(
                      leading: Icon(Icons.person),
                      title: TextFormField(
                        validator: (input) {
                          if (input.isEmpty) {
                            return 'Enter name';
                          }
                        },
                        decoration: InputDecoration(labelText: 'Name'),
                        onSaved: (input) => name = input,
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.email),
                      title: TextFormField(
                        validator: (input) {
                          if (input.isEmpty) {
                            return 'Enter email';
                          }
                        },
                        decoration: InputDecoration(labelText: 'Email'),
                        onSaved: (input) => email = input,
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.phone_android),
                      title: TextFormField(
                        validator: (input) {
                          return !(input.contains('@')) ? 'Kindly use special character @': null;
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password *',
                          hintText: 'Whom do you love the most?',
                        ),
                        onSaved: (input) => password = input,
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.school),
                      title: TextFormField(
                        validator: (input) {
                          if (input.isEmpty) {
                            return 'Enter College Name';
                          }
                        },
                        decoration: InputDecoration(labelText: 'College Name'),
                        onSaved: (input) => collegename = input,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                    ),
                    ButtonTheme(
                      height: 40.0,
                      minWidth: 200.0,
                      child: RaisedButton(
                          onPressed: _sendToNextScreen,
                          color: Colors.red,
                          child: Text(
                            'Save',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0))),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                    ),
                  ],
                ),
              )),
        ));
  }

  _sendToNextScreen() {
    if (_key.currentState.validate()) {
      //saves to global key
      _key.currentState.save();
      //send to next screen
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => HomePage(
                    name: name,
                    password: password,
                    email: email,
                    collegename: collegename,
                  )));
    } else {
      setState(() {
        _autovalidate = true;
      });
    }
  }
}
