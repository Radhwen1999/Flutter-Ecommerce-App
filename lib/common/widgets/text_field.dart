import 'package:flutter/material.dart';

class TextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
   const TextField({Key? key, required this.controller, required this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              spreadRadius: 7,
              offset: Offset(1,1),
              color: Colors.grey.withOpacity(0.2),
            )
          ]
      ),
      child: TextFormField(
        controller: controller ,
        decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: Icon(Icons.email,color: Colors.blueGrey.shade800,),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 1.0,
                )
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30)
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide:BorderSide (
                  color: Colors.white,
                  width: 1.0,
                )
            )
        ),
      ),
    );
  }
}
