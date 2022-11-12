import 'package:flutter/material.dart';
class CaptionText extends StatelessWidget {
  final String? text;

  const CaptionText({ this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.grey, fontSize: 20),
    );
  }
}
