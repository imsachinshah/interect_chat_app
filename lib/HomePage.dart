import 'package:flutter/material.dart';
import 'package:interect/ChatScreen.dart';

class HomePage extends StatelessWidget{

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Chatty"),
      ),
      body: ChatScreen(),
    );
  }
}