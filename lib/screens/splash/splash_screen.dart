import 'package:Thermo_App/screens/home/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/../screens/authentication/sign_in.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset(
        'assets/images/thermo.png', height: 120, width: 120, fit: BoxFit.fill,),
      logoWidth: 200,
      backgroundColor: Constants.thirdColor,
      loaderColor: Constants.primaryColor,
      loadingText: Text("Loading..."),
      futureNavigator: getRoute(),
    );
  }
}

Future<Widget> getRoute() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  var email = _prefs.getString('email');
  var pass = _prefs.getString('pass');
  if (email != null && pass != null)
   { print('home');
    return HomeScreen();}
  else
    {print('sign');
      print(email);
      print(pass);
    return SignInScreen();}
}
