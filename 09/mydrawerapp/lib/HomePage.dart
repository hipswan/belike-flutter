import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('My Drawer App'),
      ),
      drawer:Drawer(
        child:ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Atul"),
              accountEmail:Text("atulsingh@hkfdl.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.orange,
                child:Text("AT"),
              ),
            ),
            ListTile(
              title: Text("Home"),
              trailing: Icon(Icons.home),
            ),
            ListTile(
              title: Text("Category"),
              trailing: Icon(Icons.credit_card),
              onTap: () => Navigator.of(context).pushNamed("/a"),
            ),
            ListTile(
              title: Text("Profile"),
              trailing: Icon(Icons.more),
              onTap: () => Navigator.of(context).pushNamed("/b"),
            ),
            Divider(),
             ListTile(
              title: Text("Mascot"),
              trailing: Icon(Icons.home),
              //onTap: () => Navigator.of(context).pushNamed("/a"),
            ),
            Divider(),
             ListTile(
              title: Text("Mascot"),
              trailing: Icon(Icons.close), 
              onTap: () => Navigator.of(context).pop(),
            ),
          ],
        )
      ),
      body: Center(
        child:Column( 
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Home page")
        ],
        
        ),
      ) ,
      floatingActionButton: FloatingActionButton(
        child :Icon(Icons.cloud_circle),
        onPressed:(){

        }
      ),
      );
  }
}