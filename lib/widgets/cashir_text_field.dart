import 'package:cashir/constants/colors.dart';
import 'package:flutter/material.dart';


class CashirTextField extends StatelessWidget {
  const CashirTextField({super.key, required this.labelText, required this.borderColor, required this.focusedBorderColor, this.suffixIcon, this.obscureText = false, this.validator});
  final String labelText;
  final Color borderColor;
  final Color focusedBorderColor;
  final IconButton? suffixIcon;
  final bool? obscureText;
  final FormFieldValidator<String>? validator;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: focusedBorderColor),
        ),
        focusColor: Colors.red,
        labelText: labelText,
        suffixIcon: suffixIcon
      ),
      obscureText: obscureText??false,
      validator: validator,
    );
  }
}