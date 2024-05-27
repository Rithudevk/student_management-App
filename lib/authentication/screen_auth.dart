import 'package:flutter/material.dart';
import 'package:student_management_app/screens/login.dart';
import 'package:student_management_app/screens/signup.dart';

class ScreenAuth extends StatefulWidget {
  const ScreenAuth({super.key});

  @override
  State<ScreenAuth> createState() => _ScreenAuthState();
}

class _ScreenAuthState extends State<ScreenAuth> {
  bool islogin=true;

  void toggleScreen(){
    setState(() {
    islogin=!islogin;
    });
  }

  @override
  Widget build(BuildContext context) {
      if(islogin){
      return LoginScreen(onTap: toggleScreen,);
    }else{
      return SignUpScreen(onTap:  toggleScreen,);
    }
  }
}