import 'package:flutter/material.dart';
import 'package:todoapp/profile.dart';

class authscreen extends StatefulWidget{
  @override

  bool flagforauthen;

  authscreen ({ Key? mykey,required this.flagforauthen }): super(key: mykey);


  _authscreenstate createState() => _authscreenstate(flagforauthen);



}

class _authscreenstate extends State<authscreen> with TickerProviderStateMixin{

  bool flagforauthen;
  _authscreenstate(this.flagforauthen);


  late AnimationController _controller;
  late Animation<Alignment> _topAlignmentAnimation;
  late Animation<Alignment> _bottomAlignmentAnimation;


  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 20));
    _topAlignmentAnimation = TweenSequence<Alignment>(
      [
        TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.topLeft, end: Alignment.topRight),
          weight: 1,
        ),

        TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.topRight, end: Alignment.bottomRight),
          weight: 1,
        ),

        TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.bottomRight, end: Alignment.bottomLeft),
          weight: 1,
        ),

        TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.bottomLeft, end: Alignment.topLeft),
          weight: 1,
        ),
      ],

    ).animate(_controller);


    _bottomAlignmentAnimation = TweenSequence<Alignment>(
      [
        TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.bottomRight, end: Alignment.bottomLeft),
          weight: 1,
        ),

        TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.bottomLeft, end: Alignment.topLeft),
          weight: 1,
        ),

        TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.topLeft, end: Alignment.topRight),
          weight: 1,
        ),

        TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.topRight, end: Alignment.bottomRight),
          weight: 1,
        ),
      ],

    ).animate(_controller);


    _controller.repeat();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
          children: [

            Center(
              child: AnimatedBuilder(
                  animation: _controller,
                  builder: (context, _) {
                    return Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.purple,
                              Colors.redAccent,
                            ],
                            begin: _topAlignmentAnimation.value,
                            end: _bottomAlignmentAnimation.value,
                          ),

                        ),


                        child: authform(isloginpage: flagforauthen,),
                    );
                  }
              ),
            ),
          ]
      ),

    );
  }
}
