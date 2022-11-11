import 'package:flutter/material.dart';
import 'package:intermediate/model/user.dart';
import 'package:intermediate/network/userAPI.dart';

import '../../constants.dart';

class ShippingScreen extends StatelessWidget {
  const ShippingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Icon(
              Icons.edit,
              color: Colors.black26,
            ),
          ),
        ],
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                      thickness: 1,
                      color: Constants.secondryColor,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 60,
                        width: 350,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Constants.primaryColor,
                              textStyle: const TextStyle(fontSize: 25)),
                          onPressed: () {},
                          child: Text('Save'),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
            return Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(
                color: Constants.secondryColor,
              ),
            );
          }),
    );
  }
}
