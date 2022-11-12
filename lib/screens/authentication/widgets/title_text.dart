import 'package:flutter/material.dart';
class TitleText extends StatelessWidget {
 final String? text;

  const TitleText({ this.text});

  @override
  Widget build(BuildContext context) {
    return   Text(
      text!,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
    );
  }
}
