import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final Icon prefixIcon;
  final IconButton? suffixIcon;
  final String? Function(String?)? validator;
  final String? errorMsg;
  final Function(String)? onChanged;

  const MyTextField({
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.keyboardType,
    required this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.errorMsg,
    this.onChanged,
    super.key, required FocusNode focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        errorText: errorMsg,
      ),
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator,
      onChanged: onChanged,
    );
  }
}
