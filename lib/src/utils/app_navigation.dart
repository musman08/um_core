import 'package:flutter/cupertino.dart';
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

  // static final Map<String, WidgetBuilder> appRoutes = {
  //   AppPages.signIn.name : (ctx) => const LoginScreen(),
  //   AppPages.signUp.name : (ctx) => const SignUpScreen(),
  //   AppPages.signInWithMobile.name : (ctx) => const LoginScreen(),
  //   AppPages.phoneCodeVerification.name : (ctx) => const VerifyCodeScreen(verificationId: ''),
  //   AppPages.home.name : (ctx) => const HomePage(),
  //
  // };

}