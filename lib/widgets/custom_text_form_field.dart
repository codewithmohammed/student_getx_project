import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.initialValue,
    required this.controller,
    required this.textInputType,
    required this.textInputAction,
    required this.label,
    required this.hint,
    required this.isObscure,
    this.isLogin = false,
    this.isCapitalized = false,
    this.maxLines = 1,
    this.isLabelEnabled = true,
    required this.validator,
  });

  final String? initialValue;
  final TextEditingController controller;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final String label;
  final String hint;
  final bool isObscure;
  final bool isLogin;
  final bool isCapitalized;
  final int maxLines;
  final bool isLabelEnabled;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      decoration: InputDecoration(
        labelText: isLabelEnabled ? label : null,
        labelStyle: const TextStyle(color: Colors.yellowAccent),
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.blueGrey),
        errorStyle: const TextStyle(
            color: Colors.redAccent, fontWeight: FontWeight.bold),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.amberAccent, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.blueGrey),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.redAccent, width: 2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.redAccent,
            width: 2,
          ),
        ),
      ),
    );
  }
}
