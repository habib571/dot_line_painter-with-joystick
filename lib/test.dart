import 'dart:math';

import 'package:flutter/material.dart'; 
class Drag extends StatefulWidget {
  const Drag({super.key});

  @override
  State<Drag> createState() => _DragState();
}

class _DragState extends State<Drag> { 
    double left = 5.5 , top =80 ;
  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      body: Stack(
        children: [
          Positioned( 
                      left: left, 
                      top:top , 
                      child: GestureDetector( 
                        onPanUpdate: (details) {  
                         
                        left=max(0,left+ details.delta.dx) ; 
                         top =max(0,top+ details.delta.dy );  
                        setState(() {
                          
                        });
                        
                       
                        
                        }, 
                        child:  Container(
                          height: 20, 
                          width: 20, 
                          color: Colors.red,
                        ),

                      )
                      
                      
     ),
        ],
      ) );
}}