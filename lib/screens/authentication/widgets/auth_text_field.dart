import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  final IconData? icon;
  final String? text;
  final TextInputType? input;
  final bool passBool;
  final TextEditingController? controller;

  AuthTextField(
      {this.icon,
      this.text,
      this.input,
      this.passBool = false, this.controller,
      });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller:controller ,
      decoration: InputDecoration(
          border: UnderlineInputBorder(borderSide: BorderSide.none),
          labelText: text,
          labelStyle: TextStyle(color: Colors.black),
          prefixIcon: Icon(
            icon,
            color: Colors.black,
          ),
          fillColor: Colors.grey.shade200,
          filled: true),
      keyboardType: input,
      obscureText: passBool,
    );
  }
}
