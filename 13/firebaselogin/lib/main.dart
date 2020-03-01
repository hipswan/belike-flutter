import 'package:flutter/material.dart';
import 'Screen/HomePage.dart';


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
        primarySwatch: Colors.red,
      ),
      debugShowCheckedModeBanner: false,
      home:HomePage(),
    );
  }
}