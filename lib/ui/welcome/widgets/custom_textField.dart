import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final bool isPass;
  final TextInputType textInputType;
  final IconData icon;
  final String? Function(String?) validator;

  const TextFieldInput({
    super.key,
    required this.textEditingController,
    required this.hintText,
    required this.isPass,
    required this.textInputType,
    required this.icon,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
        borderSide: Divider.createBorderSide(context),
        borderRadius: BorderRadius.circular(20));

    return TextFormField(
      controller: textEditingController,
      decoration: InputDecoration(
          prefixIcon: Icon(icon),
          hintText: hintText,
          border: inputBorder,
          focusedBorder: inputBorder,
          enabledBorder: inputBorder,
          filled: true,
          contentPadding: const EdgeInsets.all(8)),
      keyboardType: textInputType,
      obscureText: isPass,
      validator: validator,
    );
  }
}
