import 'package:flutter/material.dart';
import 'package:intermediate/constants.dart';

class CategoriesList extends StatelessWidget {
  final String? text;

  const CategoriesList({this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 120,
        child: Text(text!),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Constants.thirdColor,
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
