import '/../screens/naviagtion/navigation_bar.dart';
import 'package:flutter/material.dart';
import '/../screens/details/details_screen.dart';
import '/../screens/splash/splash_screen.dart';
import '/../DataBase/db_helper.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  DbHelper.instance.opendatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    routes:
    {
        '/':(context)=>SplashScreen(),
      'navigation':(context)=>NavigationScreen(),
      'details':(context) =>DetailsScreen()
    });
  }
}
