import 'package:shared_preferences/shared_preferences.dart';

import '../authentication/sign_up.dart';
import 'widgets/auth_button.dart';
import 'widgets/auth_text_field.dart';
import 'widgets/caption_text.dart';
import 'widgets/route_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'widgets/title_text.dart';

class SignInScreen extends StatelessWidget {
TextEditingController emailController = TextEditingController();
TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TitleText(
                  text: 'Sign In',

                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                CaptionText(
                  text: 'welcome back. Please sign in to continue',
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.12,
                ),
                AuthTextField(
                  icon: Icons.person,
                  text: 'User Name',
                  input: TextInputType.name,
                  controller: emailController,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                AuthTextField(
                  icon: Icons.lock_outline,
                  text: 'Password',
                  input: TextInputType.visiblePassword,
                  controller: passController,
                  passBool: true,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.20,
                ),
                AuthButton(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('You are new here? '),
                    RouteText(
                        text: 'Sign Up',
                        funtion: () async{
                          SharedPreferences _prefs=await SharedPreferences.getInstance();
                          _prefs.setString('email',emailController.text);
                          _prefs.setString('pass',passController.text);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SignUpScreen()));
                        })
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
