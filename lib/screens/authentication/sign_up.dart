import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'sign_in.dart';
import 'widgets/auth_button.dart';
import 'widgets/auth_text_field.dart';
import 'widgets/caption_text.dart';
import 'widgets/route_text.dart';
import 'widgets/title_text.dart';
class SignUpScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TitleText(
                text: 'Sign Up',
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              CaptionText(
                text: 'welcome!. Please sign up to continue',
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.12,
              ),
              AuthTextField(
                icon: Icons.person,
                text: 'User Name',
                input: TextInputType.name,
                controller: null,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              AuthTextField(
                icon: Icons.email_outlined,
                text: 'Email',
                input: TextInputType.emailAddress,
                controller: emailController,

              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              AuthTextField(
                icon: Icons.lock_outline,
                text: 'Password',
                input: TextInputType.visiblePassword,
                passBool: true,
                controller: passController,
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
                  Text('Have an account? '),
                  RouteText(
                      text: 'Sign Ip',
                      funtion: () async {
                        SharedPreferences _prefs=await SharedPreferences.getInstance();
                        _prefs.setString('email',emailController.text);
                        _prefs.setString('pass',passController.text);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SignInScreen()));
                      })
                ],
              )
            ],
          ),
        ),
      ),
    ),);
  }
}
