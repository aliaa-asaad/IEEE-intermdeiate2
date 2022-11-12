import 'package:Thermo_App/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:Thermo_App/screens/details/details_screen.dart';
import 'package:Thermo_App/screens/naviagtion/navigation_bar.dart';
import 'package:Thermo_App/screens/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    routes:
    {
        '/':(context)=>SplashScreen(),
      'home':(context)=>HomeScreen(),
      'details':(context) =>DetailsScreen()
    });
  }
}
