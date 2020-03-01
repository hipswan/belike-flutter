import 'package:flutter/material.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //TODO: import images
  AssetImage circle = AssetImage("images/circle.png");
  AssetImage lucky = AssetImage("images/rupee.png");
  AssetImage unlucky = AssetImage("images/sadFace.png");

  //TODO: get an array
  List<String> itemArray;
  int luckyNumber;
  String message;
  int count;

  //TODO: init array with 25 elements
  @override
  void initState(){
    super.initState();
    count = 0;
    this.message= "";
    itemArray = List<String>.generate(25,(index) => "empty");
    generateRandomNumber();
  }
  generateRandomNumber(){
    int random = Random().nextInt(25);
    setState(() {
      luckyNumber = random;
    });

  }
  //TODO: define a getImage method
  AssetImage getImage(int index){
    String currentState = itemArray[index];
    switch(currentState){
      case "lucky":
      return lucky;
      break;
      case "unlucky":
      return unlucky;
      break;
    }
    return circle;
    
  }
  //TODO: play game method
  playGame(int index){
    if(luckyNumber == index){
      setState(() {
        itemArray[index] = "lucky";
        this.message ="You Win!!";
        count = 6;
      });
    }else{
      setState(() {
        itemArray[index] = "unlucky";
      });
    }
    count = count+1;
    if (count == 5){
      gameOver();
    }
  }

  //TODO: showall
  showAll(){
    setState((){
      itemArray = List<String>.filled(25, "unlucky");
      itemArray[luckyNumber] = "lucky";
    });
  }

  //TODO: reset all 
  resetGame(){
    setState(() {
      itemArray = List<String>.filled(25, "empty");
      generateRandomNumber();
      this.message = "";
      count =0;
    });
  }

  //TODO: Gameover after five attempts
  gameOver(){
    setState(() {
      this.message = "Game Over";
      Future.delayed(const Duration(milliseconds: 1000), () {
          resetGame();
      });
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text('Scratch and Win'),
      ),
      body:Column(
        crossAxisAlignment : CrossAxisAlignment.stretch,
        mainAxisAlignment:MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child:GridView.builder(
              padding:EdgeInsets.all(20.0),
              gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                childAspectRatio: 1.0,
                crossAxisSpacing: 10.0,
                mainAxisSpacing:10.0,
              ),
              itemCount : itemArray.length,
              itemBuilder: (context, i )=>SizedBox(
                width: 50,
                height: 50.0,
                child:RaisedButton(
                  onPressed: (){
                    this.playGame(i);
                  },
                  child: Image(
                    image:this.getImage(i),
                  ),

                )
              ),
            )
          ),
          Container(
            padding:EdgeInsets.all(20.0),
            child:Text(this.message,
            style: TextStyle(
              fontSize:20.0,
              fontWeight:FontWeight.bold,

            )
            ),
          ),
           Container(
            margin : EdgeInsets.all(15.0),
            child:RaisedButton(
              onPressed: (){
                this.showAll();
              },
              color:Colors.cyan,
              padding:EdgeInsets.all(20.0),
              child:Text(
                'Show All',
                style:TextStyle(
                  color: Colors.white,
                  fontSize: 20.0
                )),
            )
            ),
          Container(
            margin : EdgeInsets.all(15.0),
            child:RaisedButton(
              onPressed: (){
                this.resetGame();
              },
              color:Colors.cyan,
              padding:EdgeInsets.all(20.0),
              child:Text(
                'Reset',
                style:TextStyle(
                  color: Colors.white,
                  fontSize: 20.0
                )),
            )
            ),
          
        ],
    
    ),
    );
  }
}