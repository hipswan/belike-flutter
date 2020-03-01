import 'package:flutter/material.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
 AssetImage one= AssetImage("images/one.png");//asset name constructor
 AssetImage two= AssetImage("images/two.png");//asset name constructor
 AssetImage three= AssetImage("images/three.png");//asset name constructor
 AssetImage four= AssetImage("images/four.png");//asset name constructor
 AssetImage five= AssetImage("images/five.png");//asset name constructor
 AssetImage six= AssetImage("images/six.png");//asset name constructor
AssetImage diceimage_1; //= one can do but not a good approach
 AssetImage diceimage_2;
 @override
 void initState(){//initializes like constructor
  super.initState();
  setState((){
    diceimage_1 = one;
    diceimage_2= six;
  });
 }
 
 void rollDice(){
   int random_1 = (1+ Random().nextInt(6));
   int random_2 = (1+ Random().nextInt(6));
   AssetImage newImage_1;
   AssetImage newImage_2;

switch(random_1){
  case 1 : 
    newImage_1 =one;
    break;
  case 2 : 
    newImage_1 =two ;
    break;
  case 3 : 
    newImage_1 = three;
    break;
  case 4 : 
    newImage_1 = four;
    break;
  case 5 : 
    newImage_1= five;
    break;
  case 6 : 
    newImage_1 = six;
    break;
}
  switch(random_2){
  case 1 : 
    newImage_2 =one;
    break;
  case 2 : 
    newImage_2 =two ;
    break;
  case 3 : 
    newImage_2 = three;
    break;
  case 4 : 
    newImage_2 = four;
    break;
  case 5 : 
    newImage_2= five;
    break;
  case 6 : 
    newImage_2 = six;
    break;
    
}
setState((){
  diceimage_1 = newImage_1;
  diceimage_2 = newImage_2;

});
 }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(
        title : Text('Dice Roller'),
      ),
      body: Container(
        child:Center(
          child: Column(
           mainAxisAlignment : MainAxisAlignment.center,
            children: <Widget>[
              Image(
                image: diceimage_1,
                width:150.00,
                height: 150.00,
              ),
              
              Container(
                margin: EdgeInsets.only(
                  top: 50.0,
                ),
                child:Image(
                image: diceimage_2,
                width:150.00,
                height: 150.00,
              ),
              ),
              Expanded(
                child: FittedBox(
                  fit : BoxFit.contain,
                  child: Container(
                margin: EdgeInsets.only(
                  top: 100.0,
                ),
                child : RaisedButton(
                  color: Colors.yellow,
                  padding: EdgeInsets.fromLTRB(30, 15, 30, 15),//padding can be written with . 
                  child:Text('Roll the dice!',
                   style : TextStyle(fontSize : 10)
                  ),
                  onPressed: rollDice,
                  textColor: Colors.pink,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    //style: ,
                    ), // can have column incase of multiplt button
                )
              )
                ),
              )
              
            ],
          )
          )
      )
      
    );
  }
}