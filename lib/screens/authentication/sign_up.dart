import 'package:flutter/material.dart';
import 'sign_in.dart';
import 'widgets/auth_button.dart';
import 'widgets/auth_text_field.dart';
import 'widgets/caption_text.dart';
import 'widgets/route_text.dart';
import 'widgets/title_text.dart';
class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
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
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            AuthTextField(
              icon: Icons.email_outlined,
              text: 'Email',
              input: TextInputType.emailAddress,

            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            AuthTextField(
              icon: Icons.lock_outline,
              text: 'Password',
              input: TextInputType.visiblePassword,
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
                Text('Have an account? '),
                RouteText(
                    text: 'Sign Ip',
                    funtion: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SignInScreen()));
                    })
              ],
            )
          ],
        ),
      ),
    ),);
  }
}
