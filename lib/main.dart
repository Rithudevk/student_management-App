import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_management_app/firebase_options.dart';
import 'package:student_management_app/screens/splash_screen.dart';




void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options:DefaultFirebaseOptions.currentPlatform );
  runApp( MyApp());
}


class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    
    return  GetMaterialApp(
      debugShowCheckedModeBanner:false,
     
      theme: ThemeData(
        textTheme:const TextTheme(
          titleMedium: TextStyle(
            color: Colors.black
          )
        ),
        appBarTheme:const AppBarTheme(
         
         elevation: 30,
          centerTitle: true,
          
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w400
          ),
        ),

           buttonTheme: const ButtonThemeData(
            buttonColor: Colors.green,
            minWidth: 30,
            textTheme: ButtonTextTheme.normal
           )
      ),
      home:const SplashScreen() ,
    );
  }
}
