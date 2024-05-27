
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:student_management_app/screens/add_todo.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
     void addItem()async{
    await Navigator.of(context).push(MaterialPageRoute(
          builder: (ctx)=>const AddToDO()));
        
        }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: AppBar(
      actions: [  IconButton(onPressed: (){
                      FirebaseAuth.instance.signOut();
                    }, icon:const Icon(Icons.exit_to_app,
                    color: Colors.black,
                    size: 30,
      
                    ))],
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      title:const Text('Student data',
      style: TextStyle(
        color: Colors.black
      ),
      ),
    ),
    body: StreamBuilder(
      stream: FirebaseFirestore.instance
            .collection('student_detail')
            .orderBy('timestamp',
            descending:false )
            .snapshots(),
             
                
             builder: (context, snapshot) {
              var studentData=snapshot.data?.docs ;
             if(snapshot.connectionState==ConnectionState.waiting){
              return const Center(
                child: CircularProgressIndicator(),
              );
             }if(snapshot.data!.docs.isEmpty){
              return const Center(
                child: Text('No student Data'),
              );
             }
            return ListView.builder(
              itemCount: studentData!.length,
              itemBuilder: (context, index) {
              return Container(
                height: 100,
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text('${index+1}',
                        style:const TextStyle(fontSize: 15,
                        fontWeight: FontWeight.bold),)),
                      title: Text(studentData[index]['name'],
                      style:const TextStyle(fontSize: 20,
                      fontWeight: FontWeight.bold)),
                      subtitle: Text(studentData[index]['dateofbirth'],
                      style:const TextStyle(fontSize: 15,
                      fontWeight: FontWeight.bold)),
                      trailing: Text(studentData[index]['gender'],
                        style:const TextStyle(fontSize: 15,
                      fontWeight: FontWeight.bold)
                      ),

                    )
                  ),
                ),
              );
            },);
             }
             
             
             ,),
             floatingActionButton:GestureDetector(
              onTap: addItem,
              child: Container(
                margin:const EdgeInsets.only(
                  bottom: 30,
                ),
                height: 60,
                width: 180,
               decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey.shade400,
               ),
                child:const Center(
                  child: Text('Add student'),
                ),
              ),
             ) ,
             );
            
          }
          
        
   
   
  }
