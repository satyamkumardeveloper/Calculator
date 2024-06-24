import 'package:calculator/screens/calcWhite.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

Widget MyApp(){
  return MaterialApp(
    title: "Calculator",
    debugShowCheckedModeBanner: false,
    home: Calcwhite(),
  );
  
}

