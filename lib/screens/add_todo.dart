
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';




class AddToDO extends StatefulWidget {
  const AddToDO({super.key});

  @override
  State<AddToDO> createState() => _AddToDOState();
}

class _AddToDOState extends State<AddToDO> {
  var nameController=TextEditingController();
  var dateofbirthController=TextEditingController();
  var genderController=TextEditingController();
  final _formkey=GlobalKey<FormState>();
  

   String ?_currentSelectedValue;
   String _formattedDate = '';



Future<void> additem()async{
  final currentuser=FirebaseAuth.instance.currentUser;
  await FirebaseFirestore.instance
  .collection('user_email').doc(currentuser!.uid).get();
  FirebaseFirestore.instance.collection('student_detail').add({
     'name':nameController.text,
     'dateofbirth':dateofbirthController.text,
     'gender':_currentSelectedValue.toString(),
     'timestamp':Timestamp.now(),

    
  });
    Get.back();
}



var items=[
  'male',
  'female'
];





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: PreferredSize(preferredSize:const Size.fromHeight(70),
       child: AppBar(
        backgroundColor: Colors.white10,
          title:const Text('Add Your Student',
          style: TextStyle(
            color: Colors.black,
          ),
          ),
       )
       ),
      body: Container(
    
       decoration:const BoxDecoration(
       
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  TextFormField(
                    controller: nameController,
                    decoration:const InputDecoration(
                    hintText: 'Student Name'
                    ),
                    onSaved: (newValue) {
                      nameController.text=newValue!;
                    },
            
                  ),
                 const SizedBox(
                    height: 20,
                  ),
               
                   
                 TextFormField(
                   onSaved: (newValue) {
                      dateofbirthController.text=newValue!;
                    },
                  controller: dateofbirthController,
                     
                      decoration: const InputDecoration(
                       
                       hintText: 'date of birth',
                       suffixIcon: Icon(Icons.keyboard_arrow_down)
                      ),
                      onTap: () {
                        showDatePicker(
                          context: context,
                         firstDate: DateTime(2000), 
                         lastDate: DateTime(2024),

                         builder: (context,picker){
    return Theme(
    
    data: ThemeData.dark().copyWith(
      colorScheme:const ColorScheme.dark(
        primary: Colors.black,
        onPrimary: Colors.white,
        surface: Colors.white,
        onSurface: Colors.black,
        
      ),
      
     ),
     child: picker!,);
   })
   .then((selectedDate) {
   
     if(selectedDate!=null){
       setState(() {
         
         _formattedDate=DateFormat('dd/MM/yy').format(selectedDate);
         dateofbirthController.text=_formattedDate.toString();
       });

     }
 }
                         );

                      },
                    ),
                     const SizedBox(
                    height: 20,
                  ),
                  
                   Container(
                    height: 80,
                    color:Colors.grey.shade100,
                     child: DropdownButton(
                    
                        isExpanded: true,  
                        hint:const Text('Choose gender'),
                           iconSize: 20,           
                       padding:const EdgeInsets.all(10),
                       
                      value: _currentSelectedValue,
                      items: items.map((String item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(item));
                     }).toList(), 
                     onChanged: ( newvalue) {
                       setState(() {
                         _currentSelectedValue=newvalue;
                       });
                     },),
                   ),
                     
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 260,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.greenAccent
                        ),
                        onPressed:additem,
                      child: const Text('Submit')),
                    ),
                   
                  
            
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}