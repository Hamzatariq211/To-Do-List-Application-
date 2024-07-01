import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class authform extends StatefulWidget {
// @override

// _authformState creatState()=>_authformState();
  bool isloginpage;

    authform ({ Key? mykey,required this.isloginpage }): super(key: mykey);
  @override
  State<StatefulWidget> createState() => _authformState(isloginpage);
// TODO: implement createState

}

class _authformState extends State<authform> with SingleTickerProviderStateMixin {
//---------------------------------------------------------------
  bool isloginpage;
  _authformState(this.isloginpage);

  final _formkey = GlobalKey<FormState>();
  var _email = ' ';
  var _pass = ' ';

  var user = ' ';

  bool? check=false;
//-----------------------------------------------------


  startauthentication() {
    final validity = _formkey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (validity) {
      _formkey.currentState?.save();
      submitform(_email, _pass, user);
    }
  }

  submitform(String email, String password, String username) async {
    final auth = FirebaseAuth.instance;
    try {
      if (isloginpage) {
        await auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        String uid = auth.currentUser!.uid;
        final documentReference = FirebaseFirestore.instance.collection('users')
            .doc(uid);
        Map<String, dynamic> data = {
          'username': username,
          'email': email,
        };
        await documentReference.set(data);
      } else {
        await auth.signInWithEmailAndPassword(

          email: email,
          password: password,
        );
      }
    } catch (err) {
      print(err);
    }
  }

//----------------------------------------------------------------
  Widget build(BuildContext context) {

    return Container(
      height: MediaQuery
          .of(context)
          .size
          .height,
      width: MediaQuery
          .of(context)
          .size
          .width,
      child: ListView(

        children: [
          SizedBox(height: 40),

          Center(
            child: Container(
              child: isloginpage
                  ? Text(
                  'Sign up to make your Life productive!',
                style: TextStyle(fontWeight: FontWeight.bold,
                  fontFamily: 'TheComforterFont',

                  fontSize: 30,

                ),

              )
                  : Text(
                  'Wellcome back To Productivness',
              style: TextStyle(fontWeight: FontWeight.bold,
                fontFamily: 'TheComforterFont',

                fontSize: 35,


              ),

              ),
            ),
          ),


          Container(
            padding: EdgeInsets.all(45),
            child: Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (isloginpage)
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      key: ValueKey('username'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Incorrect username';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        user = value!;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(8.0),
                          borderSide: new BorderSide(),
                        ),
                        labelText: "Enter username",
                        labelStyle: GoogleFonts.roboto(),
                      ),
                    ),
                  SizedBox(height: 20),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    key: ValueKey('email'),
                    validator: (value) {
                      if (value!.isEmpty || !(value.contains('@'))) {
                        return 'Incorrect mail';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _email = value!;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(8.0),
                        borderSide: new BorderSide(),
                      ),
                      labelText: "Enter email",
                      labelStyle: GoogleFonts.roboto(),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    key: ValueKey('password'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Incorrect password';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _pass = value!;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(8.0),
                        borderSide: new BorderSide(),
                      ),
                      labelText: "Enter password",
                      labelStyle: GoogleFonts.roboto(),
                    ),
                  ),
                  SizedBox(height: 20),

                  Container(
                    child: Row(
                      children: [
                        Checkbox(
                          value: check,
                          onChanged: (bool? newvalue){
                            check=newvalue!;
                          }


                        ),

                        Text('I Accept the Term And Conditions'),

                      ],

                    ),

                  ),



                  SizedBox(height: 20),

                  Container(
                    width: double.infinity,
                    height: 70,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      child: isloginpage
                          ? Text(
                        'Signup',
                        style: GoogleFonts.roboto(fontSize: 20),
                      )
                          : Text(
                        'Login',
                        style: GoogleFonts.roboto(fontSize: 20),
                      ),
                      onPressed: () {
                          startauthentication();

                      },
                    ),
                  ),
                  SizedBox(height: 20),




                  Container(
                    child: ElevatedButton(



                      onPressed: () {
                        setState(() {
                          isloginpage = !isloginpage;
                        });
                      },
                      child: isloginpage
                          ? Text('Already A Member')
                          : Text('Not A Member?'),


                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        backgroundColor: Colors.deepOrangeAccent,
                      ),



                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}






