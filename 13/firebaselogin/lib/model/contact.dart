import 'package:firebase_database/firebase_database.dart';

class Contact{
  String _id;
  String _firstname;
  String _lastname;
  String _phone;
  String _email;
  String _address;
  String _photoUrl;


  //constructor for add


  Contact(this._firstname,this._lastname,this._phone,this._email,this._address,this._photoUrl);

  Contact.withId(this._id,this._firstname,this._lastname,this._phone,this._email,this._address,this._photoUrl);

  //getters
  String get id => this._id;
  String get firstname => this._firstname;
  String get lastname => this._lastname;
  String get phone => this._phone;
  String get email => this._email;
  String get address => this._address;
  String get photoUrl => this._photoUrl;

  //setters

  set firstName(String firstname){
    this._firstname = firstname;
  }set lastname(String lastname){
    this._lastname = lastname;
  }set phone(String phone){
    this._phone = phone;
  }set address(String address){
    this._address = address;
  }set email(String email){
    this._email = email;
  }set photoUrl(String photoUrl){
    this._photoUrl = photoUrl;
  }

  Contact.fromSnapshot(DataSnapshot snapshot){
    this._id = snapshot.key;
    this._firstname = snapshot.value['firstname'];
    this._lastname = snapshot.value['lastname'];
    this._phone = snapshot.value['phone'];
    this._address = snapshot.value['address'];
    this._photoUrl = snapshot.value['photoUrl'];
    this._email = snapshot.value['email'];

  }

Map<String,dynamic> toJson(){
  return{
    "firstname": _firstname,
    "lastname": _firstname,
    "phone": _firstname,
    "email": _email,
    "address": _address,
    "photoUrl": _photoUrl,
  };



}

  

}