import 'package:flutter/material.dart';
//helper class.used in databases to put code in parts.vaguely created so that can be used any where
class NumberAudio{
  String audioUri;
  MaterialColor buttonColor;
  String buttonText;

  NumberAudio(String aU , MaterialColor bC, String bT){
    this.audioUri = aU;
    this.buttonColor = bC;
    this.buttonText = bT;

  }

}