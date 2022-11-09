import 'package:flutter/material.dart';
import 'package:intermediate/model/user.dart';
import 'package:intermediate/network/userAPI.dart';
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
                  Container(height: 300,

                    child: ListView(
                      children:[ Container(
                        color: Colors.white,
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 5, bottom: 10, right: 5, top: 10),
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
                                  left: 5, bottom: 10, right: 5, top: 10),
                              child: Text(
                                snapShot.data!.users![0].email!.toString(),
                                style: TextStyle(
                                    color: Colors.black26,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      ),]
                    ),
                  ),
                  Container(

                    decoration: BoxDecoration(color: Constants.thirdColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10))),
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: IconButton(
                                  icon: Icon(Icons.location_on_outlined,
                                      color: Constants.primaryColor),
                                  onPressed: () {},
                                )),
                            Text(
                              "Shipping Address",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
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
                                padding: EdgeInsets.only(right: 10),
                                child: Icon(
                                  Icons.payment_sharp,
                                  color: Constants.primaryColor,
                                )),
                            Text(
                              "Payment Method",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
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
                                padding: EdgeInsets.only(right: 10),
                                child: Icon(
                                  Icons.menu_sharp,
                                  color: Constants.primaryColor,
                                )),
                            Text(
                              "Order History",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
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
                                padding: EdgeInsets.only(right: 10),
                                child: Icon(
                                  Icons.logout,
                                  color: Constants.primaryColor,
                                )),
                            Text(
                              "Logout",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 30),
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
