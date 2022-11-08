import 'package:flutter/material.dart';
import 'package:intermediate/screens/naviagtion/navigation_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: NavigationScreen()
    );
  }
}


