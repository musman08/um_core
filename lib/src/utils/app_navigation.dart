import 'package:flutter/material.dart';

class AppNavigator{

  static to(BuildContext context, Widget page){
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => page,)
    );
  }
  static pushAndRemoveUntil(BuildContext context, Widget page){
    Navigator.pushAndRemoveUntil(
      context, MaterialPageRoute(
      builder: (context) => page,),
        (route)=> false,
    );
  }
  static pushReplacement(BuildContext context, Widget page){
    Navigator.pushReplacement(
        context, MaterialPageRoute(
      builder: (context) => page,));
  }

}