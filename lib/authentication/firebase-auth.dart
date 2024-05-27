import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:student_management_app/authentication/screen_auth.dart';
import 'package:student_management_app/screens/email_varification.dart';



class FireAuth extends StatefulWidget {
  const FireAuth({super.key});

  @override
  State<FireAuth> createState() => _FireAuthState();
}

class _FireAuthState extends State<FireAuth> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(),
     builder: (context, snapshot) {
      if (snapshot.hasData) {
          return EmailVarification();
        
          } else {
            return const ScreenAuth();
          }
    
        }
    );  
     }
     
  }
