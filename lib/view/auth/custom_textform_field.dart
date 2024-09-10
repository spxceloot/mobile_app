import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.obscured,
    required this.controller,
  });

  final String hintText;
  final bool obscured;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscured,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide.none,
        ),
        filled: true,
        hintText: hintText,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 5.0,
          horizontal: 20.0,
        ),
      ),
    );
  }
}
