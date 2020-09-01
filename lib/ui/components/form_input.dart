import 'package:flutter/material.dart';

class FormInput extends StatelessWidget {
  final bool secret;
  final String placeHolder;
  final IconData icon;
  final TextInputType inputType;
  final Function onChanged;

  FormInput({
    this.secret = false,
    this.placeHolder,
    this.icon,
    this.inputType,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      child: TextField(
        autocorrect: false,
        onChanged: onChanged,
        obscureText: secret,
        keyboardType: inputType,
        textAlign: TextAlign.left,
        decoration: InputDecoration(labelText: placeHolder),
      ),
    );
  }
}
