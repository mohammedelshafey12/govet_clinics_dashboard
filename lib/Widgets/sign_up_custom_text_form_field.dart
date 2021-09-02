import 'package:flutter/material.dart';

class SignUpCustomTextFormField extends StatelessWidget {
  const SignUpCustomTextFormField({
    Key? key,
    required this.controller,
    required this.keyboardType,
    required this.title,
  }) : super(key: key);
  final controller;
  final keyboardType;
  final title;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '$title Required';
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: title,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
