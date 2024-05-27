import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.onTap});
   final void Function() onTap;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var econtroller=TextEditingController();
  var epassword=TextEditingController();
  final _formkey=GlobalKey<FormState>();


  void login()async{
  _formkey.currentState!.validate();
   
   try{
  await  FirebaseAuth.instance.signInWithEmailAndPassword
    (email:econtroller.text , 
   password: epassword.text);
   }on FirebaseAuthException catch(e){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Email or password incorrect ${e.message}'),
          ),
        );
   }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
       body:  Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Expanded(
            child: Form(
              
              key: _formkey,
              child:
               Column(
                
                 children: [
                  Container(
                    margin:const EdgeInsets.only(top: 60),
                    height: 230,
                    child:Image.asset('Assets/login_sign.png',
                    

                  fit: BoxFit.cover,
              
                  ), 
                  ),
                  
                  SizedBox(
                    height: 50,
                  ),
                 TextFormField(
                 controller: econtroller,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                  prefixIcon:const Icon(Icons.email,
                  color: Colors.black
                  ),
                  
                   hintText: 'Email',
                       hintStyle:const TextStyle(
                    color:  Colors.black
                   ),
            
                    border: OutlineInputBorder(
            
                      borderSide:const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(30),
            
                    ),
                    
            
                  ),
                  validator: (value) {
                    if(value==null || value.trim().length<6 || value.isEmpty){
                       return 'please Enter currect email Address';
                    }
                    return null;
                  },
                 ),
                const SizedBox(
                  height: 20,
                 ),
                  TextFormField(
                    obscureText: true,
                 controller: epassword,
                  decoration: InputDecoration(
                    
                      filled: true,
                      fillColor: Colors.white,
                  prefixIcon:const Icon(Icons.lock,
                  color: Colors.black ,
                  ),
                  
                   hintText: 'Password',
                   hintStyle:const TextStyle(
                    color: Colors.black
                   ),
            
                    border: OutlineInputBorder(
            
                      borderSide:const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(30),
            
                    ),
                    
            
                  ),
                    validator: (value) {
                    if(value==null || value.trim().length<6 || value.isEmpty){
                       return 'Please enter password';
                    }
                    return null;
                  },
                 ),
               const  SizedBox(height: 50,),

                     GestureDetector(
                      onTap: login,
                       child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                           border: Border.all(color: Colors.black87)
                        ),
                        
                         height: 50,
                         width: 190,
                         child:const Center(child: Text('Login',style: TextStyle(fontSize: 20),)),
                       ),
                     ),
                 const  SizedBox(height: 50,),
                   Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                   const   Text('Not a registered User ?',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,




                      ),
                      ),
                      TextButton(onPressed: widget.onTap, 
                    child:const Text('signup here',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17
                    ),
                    ))

                    ],
                   )


            
                ],
               )),
          ),
        ),
      ),
      
    );
  }
}