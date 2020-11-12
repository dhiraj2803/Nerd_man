import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nerd_man/bird.dart';
import 'package:nerd_man/gameover.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}
class _HomepageState extends State<Homepage> {
  static double birdYAxis = 0;
  double time = 0;
  double height = 0;
  double initHeight = birdYAxis;
  bool gameStarted = false;


  void jump(){
    setState(() {
      time=0;
      initHeight=birdYAxis;
    });
}
void startGame(){
    gameStarted=true;
  Timer.periodic(Duration(milliseconds: 70) , (timer)  {
    time += 0.05;
    height =-4.9*time*time+2.4*time;
    setState(() {
      birdYAxis=initHeight-height;
    });
    if(birdYAxis>1) {
      gameover();
      timer.cancel();
      gameStarted = false;

    }
  });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: GestureDetector(
              onTap: (){

                if(gameStarted){
                  jump();
                }
                else {
                  startGame();
                }
              },
              child: AnimatedContainer(
                alignment: Alignment(0,birdYAxis),
                duration: Duration(milliseconds: 0),
                color: Colors.greenAccent,
                child: Mybird(),
              ),
            ),
          ),
          Container(
            height: 10,
            color: Colors.yellowAccent,
          ),
          Expanded(
              child: Container(
                color: Colors.lightBlueAccent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("SCORE",style: TextStyle(color: Colors.black,fontSize: 20)),
                        SizedBox(
                          height: 20,
                        ),
                        Text("0",style: TextStyle(color: Colors.black,fontSize: 20)),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("BEST",style: TextStyle(color: Colors.black,fontSize: 20)),
                        SizedBox(
                          height: 20,
                        ),
                        Text("10",style: TextStyle(color: Colors.black,fontSize: 20)),
                      ],
                    )
                  ],
                ),
              )
          )
        ],
      ),
    );
  }
}
