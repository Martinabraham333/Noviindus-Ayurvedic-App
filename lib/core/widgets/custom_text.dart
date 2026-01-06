import 'package:flutter/material.dart';


class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  const CustomText(
      {super.key,
      required this.text,
       this.fontSize=16,
       this.color=Colors.black,
      this.fontWeight=FontWeight.normal, this.textAlign=TextAlign.start});

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: textAlign,
      text,
      style: TextStyle(
        
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight ?? FontWeight.normal,
      ),
    );
  }
}