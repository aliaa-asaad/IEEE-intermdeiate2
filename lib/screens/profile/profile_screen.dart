import 'package:flutter/material.dart';
import 'package:intermediate/model/user.dart';
import 'package:intermediate/network/userAPI.dart';
import 'package:intermediate/screens/profile/shippingAddress_sceen.dart';

import '../../constants.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.secondryColor,
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
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

              return Column(
                children: [
                  Container(
                    height: 150,
                    child: ListView(children: [
                      Container(
                        color: Constants.secondryColor,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 20, bottom: 10, right: 10, top: 10),
                              child: Text(
                                snapShot.data!.users![0].username.toString(),
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    wordSpacing: 1),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 20, bottom: 10, right: 5, top: 10),
                              child: Text(
                                snapShot.data!.users![0].email!.toString(),
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Constants.thirdColor,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40))),
                      padding: EdgeInsets.all(25),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50,
                          ),
                          Row(
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(right: 9),
                                  child: IconButton(
                                    icon: Icon(Icons.location_on_outlined,
                                        color: Constants.primaryColor),
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ShippingScreen()),
                                      );
                                    },
                                  )),
                              Text(
                                "Shipping Address",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                            ],
                          ),
                          Divider(
                            height: 20,
                            thickness: 1,
                            color: Colors.grey,
                          ),
                          Row(
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(right: 20, left: 10),
                                  child: Icon(
                                    Icons.payment_sharp,
                                    color: Constants.primaryColor,
                                  )),
                              Text(
                                "Payment Method",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                            ],
                          ),
                          Divider(
                            height: 20,
                            thickness: 1,
                            color: Colors.grey,
                          ),
                          Row(
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(right: 20, left: 10),
                                  child: Icon(
                                    Icons.menu_sharp,
                                    color: Constants.primaryColor,
                                  )),
                              Text(
                                "Order History",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                            ],
                          ),
                          Divider(
                            height: 30,
                            thickness: 1,
                            color: Colors.grey,
                          ),
                          Row(
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(right: 20, left: 10),
                                  child: Icon(
                                    Icons.logout,
                                    color: Constants.primaryColor,
                                  )),
                              Text(
                                "Logout",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                            ],
                          ),
                          Divider(
                            height: 20,
                            thickness: 1,
                            color: Colors.grey,
                          )
                        ],
                      ),
                    ),
                  )
                ],
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
