import 'package:flutter/material.dart';
import 'package:intermediate/DataBase/db_helper.dart';
import 'package:intermediate/screens/details/details_screen.dart';
import 'package:intermediate/screens/naviagtion/navigation_bar.dart';

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
        '/':(context)=>NavigationScreen(),
      'details':(context) =>DetailsScreen(),
    });
  }
}
