import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_management_app/authentication/firebase-auth.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
   
    super.initState();
    Timer(
      Duration(seconds: 3),
     () {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) =>const FireAuth(),));
     });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
            height: 300,
            width: 200,
            decoration:const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('Assets/login_sign.png'))
            ),
                  ),
                const  SizedBox(
                    height: 20,
                  ),
                  Text('W E L C O M E  !',
                  style: TextStyle(
                    fontSize: 20,
                   fontFamily: GoogleFonts.prata().fontFamily,
                    
                  ),
                  )
          ],
        )),
    );
  }
}