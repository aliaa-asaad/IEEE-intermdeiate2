import 'package:Thermo_App/constants.dart';
import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(Constants.primaryColor)),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('navigation');
          },
          child: Text(
            'Continue',
            style: TextStyle(fontSize: 20),
          )),
    );
  }
}
