import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'SigninPage.dart';
import 'SignUpPage.dart';


void main() => runApp(MyApp());

// First put json file in andorid in ios
// use gradle in android plugin
// do same for Ios 
//yaml for flutter 

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FireBase Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home:HomePage(),
      routes: <String,WidgetBuilder>{
        "/SigninPage":(BuildContext context)=> SigninPage(),
        "/SignUpPage":(BuildContext context)=> SignUpPage(),
      }
    );
  }
}