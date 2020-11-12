import 'main.dart';
import 'package:flutter/material.dart';
class gameover extends StatefulWidget {
  @override
  _gameoverState createState() => _gameoverState();
}

class _gameoverState extends State<gameover> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('GAME OVER',style: TextStyle(color: Colors.black,fontSize: 20),)
        ],
      ) ,
    );
  }
}
