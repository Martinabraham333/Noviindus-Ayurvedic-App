import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback ontap;
  final double width;
  final Color backGroundColor;
  final Color textColor;
  const CustomButton(
      {super.key,
      required this.title,
      required this.ontap,
       this.width=double.infinity,  this.backGroundColor=const Color(0xFF006837),  this.textColor=Colors.white});

  @override
  Widget build(BuildContext context) {
 
    return Container(
        width: width,
        decoration: BoxDecoration(
            color:  backGroundColor, borderRadius: BorderRadius.circular(10)),
        child: TextButton(
            onPressed: ontap,
            child: Text(
              title,
              style: TextStyle(color:textColor, fontSize: 20),
            )));
  }
}
