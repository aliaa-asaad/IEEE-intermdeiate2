import 'package:flutter/material.dart';
import 'package:intermediate/model/user.dart';
import 'package:intermediate/network/userAPI.dart';

import '../../constants.dart';

class ShippingScreen extends StatelessWidget {
  const ShippingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.thirdColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Constants.primaryColor,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          "Shipping Address",
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Constants.thirdColor),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: FutureBuilder<Users>(
          future: UserAPI().getData(),
          builder: (context, snapShot) {
            if (snapShot.hasError) {
              print(snapShot.error.toString());
            }
            if (snapShot.hasData) {
              print(snapShot.data);

              return Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        'First Name',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Text(
                      snapShot.data!.users![0].name!.firstname.toString(),
                      style: TextStyle(
                          color: Colors.black26,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                    Divider(
                      height: 10,
                      thickness: 1,
                      color: Constants.secondryColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        'Last Name',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Text(
                      snapShot.data!.users![0].name!.lastname.toString(),
                      style: TextStyle(
                          color: Colors.black26,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                    Divider(
                      height: 10,
                      thickness: 1,
                      color: Constants.secondryColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        'Email',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Text(
                      snapShot.data!.users![0].email.toString(),
                      style: TextStyle(
                          color: Colors.black26,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                    Divider(
                      height: 10,
                      thickness: 1,
                      color: Constants.secondryColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        'Phone Number',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Text(
                      snapShot.data!.users![0].phone.toString(),
                      style: TextStyle(
                          color: Colors.black26,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                    Divider(
                      height: 10,
                      thickness: 1,
                      color: Constants.secondryColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        'Address Line',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Text(
                      snapShot.data!.users![0].address!.number.toString() +
                          ',' +
                          snapShot.data!.users![0].address!.street.toString() +
                          ',' +
                          snapShot.data!.users![0].address!.city.toString(),
                      style: TextStyle(
                          color: Colors.black26,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                    Divider(
                      height: 10,
                      thickness: 1,
                      color: Constants.secondryColor,
                    ),
                  ],
                ),
              );
            }
            return Center(
              child: Container(
                child: CircularProgressIndicator(),
                height: 100,
                width: 100,
              ),
            );
          }),
    );
  }
}
