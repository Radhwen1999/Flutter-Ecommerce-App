import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? color;
  const CustomButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        text,
        style: TextStyle(
          color: color == null ? Colors.white : Colors.white,
          fontSize: 30,
          fontFamily: "stat"
        ),
      ),
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        //maximumSize: Size(350, 80),
        minimumSize: const Size(200, 60),
        primary: color,
      ),
    );
  }
}
// Container(
// width: w*0.5,
// height:h*0.08  ,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(30),
// gradient: LinearGradient(
// colors: [
// //Color.fromARGB(32, 29, 201, 192),
// //Color.fromARGB(255, 125, 221, 216),
// Color.fromRGBO(32, 38, 57, 1),
// Color.fromRGBO(63, 76, 119, 1)
// ],
// stops: [0.5, 1.0],
// ),
// ),
// child: Center(
// child: Text("Sign in",
// style: TextStyle(
// fontSize:36,
// color: Colors.white,
// fontWeight: FontWeight.bold,
//
// ),),
// ),
// )