import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key, required this.onTap});
  final void Function() onTap;

  @override
  State<SignUpScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SignUpScreen> {

  var econtroller=TextEditingController();
  var epassword=TextEditingController();
  var ucontroller=TextEditingController();

final _key=GlobalKey<FormState>();
  void signup()async{
    _key.currentState!.validate();
   try{
   final userCredential=await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email:econtroller.text ,
    password: epassword.text);

    await userCredential.user?.sendEmailVerification();

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('A verification email has been sent to ${econtroller.text}.'),
          ),
        );
    
   }on FirebaseAuthException catch(e){
    ScaffoldMessenger.of( context).showSnackBar(
          SnackBar(
            content: Text('Failed to sign up ${e.message}'),
          ),
        );
   }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      
      body:  SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Expanded(
              child: Form(
                key: _key,
                child:
                 Column(
                  
                   children: [
                    Container(
                      margin:const EdgeInsets.only(top: 60),
                      height: 200,
                      child:Image.asset('Assets/login_sign.png',
                    fit: BoxFit.cover,
                
                    ), 
                    ),
                    
                const   SizedBox(
                      height: 20,
                    ),
                   
                    TextFormField(
                   controller: ucontroller,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                    prefixIcon:const Icon(Icons.account_circle,
                    color: Colors.black,
                    ),
                    
                     hintText: 'Username',
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
                         return 'please Enter atleast 6 characters';
                      }
                      return null;
                    },
                   ),
                  const SizedBox(
                    height: 20,
                   ),
        
                   TextFormField(
                   controller: econtroller,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                    prefixIcon: Icon(Icons.email,
                    color:  Colors.black,
                    ),
                    
                     hintText: 'Email',
                         hintStyle: const TextStyle(
                      color:  Colors.black
                     ),
              
                      border: OutlineInputBorder(
              
                        borderSide:const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(30),
              
                      ),
                      
              
                    ),
                      validator: (value) {
                      if(value==null || value.trim().length<6 || value.isEmpty){
                         return 'please Enter currect email address';
                      }
                      return null;
                    },
                   ),
                 const  SizedBox(
                    height: 20,
                   ),
                    TextFormField(
                   controller: epassword,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                    prefixIcon:const Icon(Icons.lock,
                    color:  Colors.black
                    ),
                    
                     hintText: 'Password',
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
                         return 'please Enter your password';
                      }
                      return null;
                    },
                   ),
                   
                 const  SizedBox(height: 30,),
                   
        
                  GestureDetector(
                        onTap: signup,
                         child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                             border: Border.all(color: Colors.black87)
                          ),
                          
                           height: 50,
                           width: 190,
                           child:const Center(child: Text('SignUp',style: TextStyle(fontSize: 20),)),
                         ),
                       ),
                     const SizedBox(height: 20,),

                     Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      const  Text('Already have an account ?',
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.black,
        
                            
        
        
                        ),
                        ),
                      TextButton(onPressed: widget.onTap, 
                      child:const Text('login here',
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
      ),
      
    );
  }
}