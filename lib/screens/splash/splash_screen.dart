import 'package:Thermo_App/screens/authentication/sign_in.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:Thermo_App/screens/naviagtion/navigation_bar.dart';
import '../../constants.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset(
        'assets/images/thermo.png',height: 120,width: 120,fit: BoxFit.fill,),
      logoWidth: 200,
      backgroundColor:Constants.thirdColor,
      loaderColor:Constants.secondryColor,
      showLoader: true,
      loadingText: Text("Loading..."),
      navigator:SignInScreen(),
      durationInSeconds: 5,
    );
  }
}
