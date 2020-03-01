import 'package:flutter/material.dart';
import 'dart:math';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
  return MaterialApp(
    title:'BG Changer',
    debugShowCheckedModeBanner: false,
    theme:ThemeData.dark(),
    home:Scaffold(
      appBar: AppBar(
        title:Text('Random Background')
      ),
      body: HomePage(),
      )

  );
}
}




class HomePage extends StatefulWidget {//dummyclass
  @override
   _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {//stateclass
   var colors = [
     Colors.amber,
     Colors.orange,
     Colors.blue,
     Colors.yellow,
     Colors.red,
     Colors.pink,
     Colors.teal,
     Colors.blueGrey,
     Color(0xFF1245)
   ];

   var currentColor = Colors.white;
    var diffcolor =Colors.white;

    setRandomColor(){
      var rnd =Random().nextInt(colors.length);
      setState((){
        diffcolor = currentColor;
        currentColor = colors[rnd];      });
    }
   
   @override
   Widget build(BuildContext context) {
    return Container(
       color : currentColor,
       child: Center(
         child: RaisedButton(
          color :currentColor,
          padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          child:Text('Change It Damnit!!',
            style:TextStyle(
            fontSize:20,
            fontWeight :FontWeight.bold,
            color:diffcolor,
            ),
          ),
          onPressed : (){
            setRandomColor();
            },
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),//not setRandomColor() call for the first time or (){setRandomColor();}
           ),
       )
       )
    );
  }
} 