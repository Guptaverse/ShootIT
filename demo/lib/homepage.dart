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
  double playerX = 0;
  void moveLeft(){
    setState(() {
      if(playerX-0.1>-1){
        playerX -= 0.1;
      }
    });
  }
  void moveRight(){
    setState(() {
      if(playerX+0.1<1){
        playerX+=0.1;
      }
    });
  }
  void fire(){
    setState(() {
      // playerX -= 0.1;
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
      },
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              
              color: Colors.blue[50],
              child: Center(child: Stack(
                children: [
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