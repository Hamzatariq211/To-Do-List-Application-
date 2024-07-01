import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Todolist extends StatelessWidget {
  final String tname;
  final bool taskcom;
  Function (bool?)? onChanged;
  Function(BuildContext)? deleteFunction;


  Todolist({super.key,
    required this.tname,
    required this.taskcom,
    required this.onChanged,
    required this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0 ,right: 20.0, top: 20.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(onPressed: deleteFunction,
              icon: Icons.delete_outline_sharp,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(70),
            )

          ],
        ),


        child: Container(
          padding:  const EdgeInsets.all(24.0),
          child: Row(
            children: [

              //check box
              Checkbox(value: taskcom, onChanged: onChanged , activeColor: Colors.black),

              //task name
              Text(
                tname,
                style: TextStyle(
                  decoration: taskcom?TextDecoration.lineThrough:TextDecoration.none,
                ),




              ),
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.white60,
            borderRadius: BorderRadius.circular(50),


          ),

        ),
      ),
    );
  }
}

