import 'package:ayurvedic_centre_patients/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final String? title;
  final IconData? icon;
  final double widthSize;
  final bool? readonly;
  final VoidCallback? ontap;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.title,
    this.widthSize = double.infinity,
    this.icon,
    this.readonly,
    this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: CustomText(text: title!),
        ),

        TextField(
          readOnly: readonly ?? false,
          cursorColor: Colors.black,
          controller: controller,
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
            hintStyle: TextStyle(color: Colors.grey),
            hintText: hintText,
            border: InputBorder.none,
            suffixIcon: GestureDetector(
              onTap: ontap,
              child: Icon(icon, color: Colors.grey),
            ),
            filled: true,
            fillColor: Color(0x1A000000),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0x1A000000)),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0x1A000000)),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}
