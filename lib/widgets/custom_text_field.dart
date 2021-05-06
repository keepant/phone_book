import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final int maxLines;
  final Widget? suffixIcon;
  final bool obscureText;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.label,
    this.keyboardType,
    this.validator,
    this.obscureText = false,
    this.suffixIcon,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        LabelTextField(label),
        TextFormField(
          keyboardType: keyboardType,
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            isDense: true,
            hintText: label,
            labelStyle: TextStyle(color: Colors.grey[700]),
            suffixIcon: suffixIcon,
          ),
          maxLines: maxLines,
          validator: validator ??
              (value) {
                if (value!.isEmpty) {
                  return '$label cannot be empty!';
                }

                return null;
              },
        ),
      ],
    );
  }
}

class LabelTextField extends StatelessWidget {
  final String label;

  const LabelTextField(this.label);

  @override
  Widget build(BuildContext context) {
    return Text(label, style: TextStyle(fontWeight: FontWeight.bold));
  }
}
