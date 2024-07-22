import 'package:flutter/material.dart';

TextStyle generalStyle(){
  return const TextStyle(
    color: Colors.black87, 
    fontWeight: FontWeight.bold
  );
}

TextStyle titleStyle(){
  return const TextStyle(
    fontSize: 30,
    color: Colors.black
  );
}

TextStyle navBarStyle(){
  return const TextStyle(
    fontSize: 18,
    color: Colors.black
  );
}

BoxDecoration boxDecorationContainer(){
  return BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10.0),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.1),
        spreadRadius: 5,
        blurRadius: 7,
        offset: const Offset(0, 3)
      ),
    ],
  );
}