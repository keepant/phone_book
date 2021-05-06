import 'package:flutter/material.dart';

class CustomLabelTextField extends StatelessWidget {
  final String label;

  const CustomLabelTextField(this.label);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 17.0,
        color: Colors.black87,
      ),
    );
  }
}
