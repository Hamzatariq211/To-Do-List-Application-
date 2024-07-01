import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:todoapp/myhomepage.dart';
import 'package:todoapp/authenscreen.dart';

class Thefirstpage extends StatefulWidget {






  @override
  State<Thefirstpage> createState() => _ThefirstpageState();
}

class _ThefirstpageState extends State<Thefirstpage> {

  bool truef=true;
  bool falsef=false;



  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      backgroundColor: Colors.purple,
      body: SafeArea(

          child: Center(



            child: Column(
              children: [
                SizedBox(height: 40,),
                Text(
                    'Hello Again!',
                  style: TextStyle(fontWeight: FontWeight.bold , fontSize: 30,
                    fontFamily: 'TheLobsterFont',
                  ),
                ),
                SizedBox(height: 10,),
                Text(
                  'Productivity Buddy Missed You!',
                  style: TextStyle(fontWeight: FontWeight.w800 , fontSize: 20),
                ),

                SizedBox(height: 40,),

                Container(
                  child: Lottie.asset(
                      'animations/122766-producivity.json',
                    height: 230,
                    repeat: true,
                    reverse: true,
                    fit: BoxFit.cover,
                  ),

                ),
                SizedBox(height: 180,),

                Container(
                  height: 10,
                  color: Colors.white,
                ),

                Container(
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 106,vertical: 30),

                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,

                      padding: EdgeInsets.symmetric(horizontal: 80,vertical: 20),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                      side: BorderSide(color: Colors.black, width: 4),

                    ),

                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => authscreen(flagforauthen: false) ));
                    },
                    

                    child: Text(''
                        'Log In',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),




            Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 101,vertical: 10),

              child:  ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,

                  padding: EdgeInsets.symmetric(horizontal: 80,vertical: 20),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                  side: BorderSide(color: Colors.black, width: 4),

                ),

                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => authscreen(flagforauthen: true) ));
                },

                child: Text(''
                    'Sign Up',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),

                Container(
                  height: 65,
                  color: Colors.white,
                )


              ],
            ),

          ),
        ),



        );
  }
}
