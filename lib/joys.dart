import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';  
import 'package:flutter_joystick/flutter_joystick.dart';

import 'main.dart'; 



class JoystickExample extends StatefulWidget {
const    JoystickExample({Key? key}) : super(key: key);
  @override
   _JoystickExampleState createState() => _JoystickExampleState();
}

class _JoystickExampleState extends State<JoystickExample> { 

  double ballSize = 35.0;
double step = 10.0;
  final List<Offset> _pts =[] ;
   void create() {
   
       setState(() {
    final pt = Offset(x, y ) ;
      _pts.add(pt); 
   
      
    }) 
    ; 
     print('************************ $_pts') ;
  } 
  deleteLastpoint() {  
    _pts.removeLast() ;

  } 
  deletAllPoint() {  
    _pts.removeRange(0, _pts.length) ;
    
  }
  double x = 50;
  double y = 50;
  final JoystickMode _joystickMode = JoystickMode.all;

  @override
  void didChangeDependencies() {
    x = MediaQuery.of(context).size.width / 2 - ballSize / 2;
    super.didChangeDependencies();
  }

    double left = 5.5 , top =80 ;
  @override
  Widget build(BuildContext context) { 
    return Scaffold(
    
     
         floatingActionButton: FloatingActionButton(  
          child: const Icon(Icons.add_alert),
          
          onPressed: () { 
              create() ;
            
          }
          
          ),
    
      body: SafeArea(
        child: Stack(
          children: [ 
           
         CustomPaint(
          painter: DotPainter(
                _pts,
            Paint()..color = Colors.black,
            Paint()
              ..color = Colors.black
              ..strokeWidth = 2.0,
          ),
          size: Size.infinite,
        ),
            Ball(x, y),
            Align(
              alignment: const Alignment(0, 0.8),
              child: SizedBox( 
                width: 120, 
                height: 120,
                child: Joystick(
                  mode: _joystickMode,
                  listener: (details) {
                    setState(() {
                       x = x + step * details.x;
                      y = y + step * details.y;
                    }); 
                  
              
                  },
                ),
              ),
            ), 
            Positioned(  
              bottom: 20, 
              left: 30,

              child: IconButton(
                onPressed: () {   

              deleteLastpoint() ;


                 },
                icon: const Icon(Icons.arrow_back)
              )  
            ) ,   
         
           Positioned( 
              left:left, 
              top:top , 
              child: GestureDetector( 
                onPanUpdate: (details) {  
                 
              
                setState(() {
                    left=max(0,left+ details.delta.dx) ; 
                 top =max(0,top+ details.delta.dy );  
                 print("ffffffffff");
                });
               
                
                }, 
                child:  Container(
                  height: 70, 
                  width: 70, 
                  color: Colors.red,
                ),

              )
              
              
              )
            
          ],
        ), 
      
      ),
    );
  }
}
class Ball extends StatelessWidget {
  final double x;
  final double y;

  const Ball(this.x, this.y, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: x,
      top: y,
      child: 
       

        const  Image(
          image: AssetImage("images/Veasense.png") , 
        height:70, 
        width: 70,
          
          ),
   
    );
  }
}