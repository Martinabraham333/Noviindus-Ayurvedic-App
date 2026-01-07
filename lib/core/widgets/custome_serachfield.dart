import 'package:flutter/material.dart';

class CustomSearchTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final IconData? icon;
  final double widthSize;
  final bool? readonly;
  final VoidCallback? ontap;

  const CustomSearchTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.widthSize = double.infinity,
    this.icon,
    this.readonly,
    this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widthSize,
      child: TextField(
        readOnly: readonly ?? false,
        cursorColor: Colors.black,
        controller: controller,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 12,
        ),
        decoration: InputDecoration(
          isDense: true, 
          contentPadding: const EdgeInsets.symmetric(
            vertical: 10, 
            horizontal: 10,
          ),
          hintStyle: const TextStyle(
            color: Colors.black54,
            fontSize: 12, 
          ),
          hintText: hintText,
        prefixIcon:  icon != null
              ? GestureDetector(
                  onTap: ontap,
                  child: Icon(
                    icon,
                    color: Colors.black,
                    size: 18, 
                  ),
                )
              : null,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}