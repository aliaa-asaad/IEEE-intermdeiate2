import '/../screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import '/../screens/details/details_screen.dart';
import '/../screens/splash/splash_screen.dart';
import '/../DataBase/db_helper.dart';

void main() {
  DbHelper.instance.opendatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
