import 'dart:async';
import 'package:demo/button.dart';
import 'package:demo/player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // player Variables
  static double playerX = 0;


  //missile Variables
  double missileX=playerX;
  double missileY=1;
  double missileHeight =0;

  void moveLeft(){
    setState(() {
      if(playerX-0.1>-1){
        playerX -= 0.1;
      }
      missileX=playerX;
    });
  }
  void moveRight(){
    setState(() {
      if(playerX+0.1<1){
        playerX+=0.1;
      }
      missileX=playerX;
    });
  }

  // resetMissile

  void resetMissile(){
    setState(() {
      missileX =  playerX;
      missileHeight=0;
    });
  }
  void fire(){
    Timer.periodic(Duration(milliseconds: 10), (timer) {
      if(missileHeight>MediaQuery.of(context).size.height*3/4){
        resetMissile();
        //cancel the timer
        timer.cancel();
      }
      else{
        setState(() {
          missileHeight+=10;
        });
      }
     });
  }
  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      focusNode: FocusNode(),
      autofocus: true,
      onKey: (RawKeyEvent event){
        if(event.isKeyPressed(LogicalKeyboardKey.arrowLeft)){
          moveLeft();
        }
        else if(event.isKeyPressed(LogicalKeyboardKey.arrowRight)){
          moveRight();
        }
        else if(event.isKeyPressed(LogicalKeyboardKey.space)){
          fire();
        }
      },
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              
              color: Colors.blue[50],
              child: Center(child: Stack(
                children: [
                  // Container(
                  //   alignment: Alignment(missileX,missileY),
                  //   child: Container(
                  //     width: 5,
                  //     height: missileHeight,
                  //     color: Colors.red,
                  //   ),
                  // ),
                  Container(
                    alignment: Alignment(playerX, 1),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Container(
                        // color: Color.fromARGB(255, 7, 255, 102),
                        // height: MediaQuery.of(context).size.height*(3/4),
                        height: missileHeight,
                        width: 50,
                        child:Container(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            width: 5,
                            height: missileHeight,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                  ),
                  MyPlayer(playerX:playerX),
                ],
              )),
            ) 
          ),
          Expanded(
            child:Container(
              color: Colors.green,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:  [
                  // MyButton(icon: Icons.play_arrow,),
                  MyButton(
                    icon: Icons.arrow_back,
                    function:moveLeft
                    ),
                  MyButton(
                    icon: Icons.arrow_upward,
                    function :fire
                    ),
                  MyButton(
                    icon: Icons.arrow_forward,
                    function :moveRight
                    )
                ],
              ),
            ) )
        ],
    
      ),
    );
  }
}