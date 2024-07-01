import 'dart:ffi';

import 'package:todoapp/todolist.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class Theapp extends StatefulWidget {


  @override
  _TheappState createState() => _TheappState();
}

class _TheappState extends State<Theapp> {

final control= TextEditingController();


  List TheList = [
    ["The Daily Morning Task",false],
  ];

  void changecheckcondition(bool? value, int index )
  {
    setState(() {
      TheList[index][1]=!TheList[index][1];

    });

  }

//function for saving new task
  void save()
  {
    setState(() {
      TheList.add([control.text,false]);
      Navigator.of(context).pop();
      control.clear();
    });
  }




  void createnewtask()
  {
    showDialog(context: context,
        builder: (context)
        {
          return AlertDialog(
            backgroundColor: Colors.white38,
            content:Container(
              height: 120,

              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  TextField(
                    controller: control,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Add New Text',
                      hintMaxLines: 10,

                    ),
                  ),

                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                     MaterialButton(onPressed: (){save();},
                     child: Text('Save'),
                       color: Colors.white,
                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                     ),


                     MaterialButton(onPressed: (){return Navigator.of(context).pop();},
                       child: Text('Cancel'),
                       color: Colors.white,
                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                     )
                   ],
                 )


                ],


              ),


            ),



          );
        }
    );
  }

  void deletetask(int index)
  {
    setState(() {
  TheList.removeAt(index);
    });

  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      appBar: AppBar(

        leading: IconButton(
          onPressed: (){},
          icon: Icon(Icons.menu),

        ),

        centerTitle: true,
        title: Text(
            'The Productivity Buddy',
        style: TextStyle(fontFamily: 'TheLobsterFont'),

        ),


        elevation: 9,

        backgroundColor: Colors.black,

        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
              topLeft: Radius.zero,
              topRight: Radius.zero,
            )
        ),

        toolbarHeight: 70,

        actions: [
          Container(
            child: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage('https://www.shutterstock.com/image-vector/productivity-icon-trendy-flat-style-260nw-1425523244.jpg'),
            ),



            // child: Image.asset('assets/images/122.jpeg'),
            // ),
          ),
        ],
      ),




      //BODY
      body: ListView.builder(
        itemCount: TheList.length,
        itemBuilder: (context, index){
          return Todolist(
            tname: TheList[index][0],
            taskcom: TheList[index][1],
            onChanged: (value) => changecheckcondition(value,index),
            deleteFunction: (context)=> deletetask(index),
          );
        },
      ),









      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
          child: GNav(
              gap: 8,
              backgroundColor: Colors.black,
              color: Colors.white,
              activeColor: Colors.white,
              tabBackgroundColor: Colors.white12,

              onTabChange: (index){

                if (index==0)
                  {
                    createnewtask();
                  }
               else if (index==1)
                {
                  print('search command');
                }

                else if (index==2)
                {
                }

                else if (index==3)
                {
                  signOutUser();
                }

              },

              padding: EdgeInsets.all(15),
              tabs: const[
                GButton(
                    icon: Icons.add_circle,
                  text: 'Add Task',
                  //padding: EdgeInsets.symmetric(horizontal: 15.0 , vertical: 15),
                ),
                GButton(
                    icon: Icons.search,
                text: 'View Tasks',
                  //padding: EdgeInsets.symmetric(horizontal: 15.0 , vertical: 15),
                ),
                GButton(
                  icon: Icons.person_pin,
                  text: 'Profile',
                 // padding: EdgeInsets.symmetric(horizontal: 15.0 , vertical: 15),
                ),
                GButton(
                    icon: Icons.settings,
                  text: 'Settings',
                 // padding: EdgeInsets.symmetric(horizontal: 15.0 , vertical: 15),
                ),




              ],
            ),
        ),
      ),


    );
  }
}





Future<void> signOutUser() async {
  await FirebaseAuth.instance.signOut();
  // Additional code after signing out, if needed
}

