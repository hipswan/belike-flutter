import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: MyButton(),
    ));
}

class MyButton extends StatefulWidget{
    @override
    MyButtonState createState(){
      return MyButtonState();
}

}


class MyButtonState extends State<MyButton>{
  int counter = 0;
  List<String> spanishnumbers = [
    "uno",
    "dos",
    "tres",
    "cuatro",
    "cinco",
    "sies",
    "seite",
    "ocho",
    "nueve",
    "dietz"
  ]; 
  String defaultText = "Spanish numbers";
  String defaultnormalText = "Number";

  void displaySnmubers(){
    setState(() {
      
      if(counter<10){
        defaultText = spanishnumbers[counter];
        counter ++;
        defaultnormalText = counter.toString();
        }
      else{
         counter = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title:Text('My Stateful App'),
        backgroundColor: Colors.orange,
      ),
      body:Container(
         child: Center(
           
           child : 	Column(
             
             mainAxisAlignment: MainAxisAlignment. center,
             children: <Widget>[
               Text(defaultText,style : TextStyle(fontSize: 30.0)),
               Text(defaultnormalText,style : TextStyle(fontSize: 30.0)),
               Padding(padding : EdgeInsets.all(20.0)),
                Align(
                
                 alignment : Alignment.bottomLeft,
                 child : FloatingActionButton(
                  
                     onPressed: displaySnmubers,
                    backgroundColor: Colors.orange,
                  
                  ),  

                     
              ),
               ],
               
               ),
	          
              )
        
               
               ),

    );

  }


}