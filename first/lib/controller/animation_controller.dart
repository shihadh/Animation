import 'package:flutter/material.dart';

class AnimationControllerP extends ChangeNotifier{
 bool islarge = false;
 late AnimationController rotationTransitionaController; 
 
 void init(TickerProvider vsync){
  rotationTransitionaController = AnimationController(
    duration: Duration(seconds: 15),
    vsync: vsync)..repeat();
 }

 void change(){
  islarge =true;
  notifyListeners();
  // islarge = false;
 }

}