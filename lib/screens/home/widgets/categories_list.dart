import 'package:flutter/material.dart';
import 'package:intermediate/constants.dart';

class CategoriesList extends StatelessWidget {
  final String? text;
  final Color? borderColor;
  final Function()? function;
  const CategoriesList({this.text, this.borderColor, this.function});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        width: 120,
        child: Text(text!),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Constants.thirdColor,
            border: Border.all(color:borderColor!,width: 2 ),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
