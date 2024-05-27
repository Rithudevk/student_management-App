
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:student_management_app/screens/home.dart';


class EmailVarification extends StatefulWidget {
  @override
  State<EmailVarification> createState() => _EMailVarificationState();
}

class _EMailVarificationState extends State<EmailVarification> {
 bool isEmailvarified=false;
 Timer? timer;
 @override
  void initState() {
   
    super.initState();
    isEmailvarified=FirebaseAuth.instance.currentUser!.emailVerified;
    if(!isEmailvarified){
      sendverificationEmail();
    }
    timer=Timer.periodic(const Duration(seconds: 3), (timer) =>checkemailVarified());
  }

Future<void>sendverificationEmail()async{
  final user=FirebaseAuth.instance.currentUser!;
  await user.sendEmailVerification();

}
@override
  void dispose() {
   
    super.dispose();
    timer!.cancel();
  }

Future checkemailVarified()async{
await FirebaseAuth.instance.currentUser!.reload();
  setState(() {
    isEmailvarified=  FirebaseAuth.instance.currentUser!.emailVerified;
  });
  if(isEmailvarified){
    timer!.cancel();
  }
}

  @override
  Widget build(BuildContext context) =>isEmailvarified?const Home():Scaffold(
    
      appBar: AppBar(title:const Text('Verify your Email',style: TextStyle(color: Colors.black),),
      backgroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          const  Text('Please verify your email address',
            style: TextStyle(
              fontSize: 20,
            ),
            ),
         const   SizedBox(height: 10,),
           TextButton(onPressed: () async {
                User? user = FirebaseAuth.instance.currentUser;
                await user?.sendEmailVerification();
                ScaffoldMessenger.of(context).showSnackBar(
                const  SnackBar(
                    content: Text('Verification email sent again.'),
                  ),
                );
              },child:const Text('Resend Varification',style: TextStyle(fontSize: 15,color: Colors.green),))
          ],
        ),
      ),
    );
}