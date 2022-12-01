import 'package:flutter/material.dart';
import '../authentication/sign_in.dart';
import '/../model/user.dart';
import '/../network/userAPI.dart';
import 'shippingAddress_screen.dart';
import 'payment_screen.dart';
import '../../constants.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.thirdColor,
      appBar: AppBar(iconTheme: IconThemeData(color: Constants.primaryColor),
        title: Text(
          "Profile",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
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
                        color: Constants.thirdColor,
                        margin: EdgeInsets.only(left: 30),
                        child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 50,
                                backgroundImage: NetworkImage(
                                  'https://th.bing.com/th/id/R.9f50b5a313af60b2f20c86afac116835?rik=KsRoR%2ffXJ%2brZWA&riu=http%3a%2f%2ficon-library.com%2fimages%2fno-profile-picture-icon%2fno-profile-picture-icon-15.jpg&ehk=pPbvrx2x8%2bTYo5rW3%2bixebN91Ui8y3%2fdyVIA8kIBueU%3d&risl=&pid=ImgRaw&r=0',
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 20,
                                        bottom: 10,
                                        right: 10,
                                        top: 10),
                                    child: Text(
                                      snapShot.data!.users![0].username
                                          .toString(),
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          wordSpacing: 1),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 20,
                                        bottom: 10,
                                        right: 20,
                                        top: 10),
                                    child: Text(
                                      snapShot.data!.users![0].email!
                                          .toString(),
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ],
                              ),
                            ]),
                      ),
                    ]),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(35),
                              topRight: Radius.circular(35))),
                      padding: EdgeInsets.all(25),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(right: 8),
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
                            thickness: 1,
                            color: Colors.grey,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => PaymentScreen()),
                              );
                            },
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 20, left: 10),
                                  child: Icon(Icons.payment_sharp,
                                      color: Constants.primaryColor),
                                ),
                                Text(
                                  "Payment Method",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                          Divider(
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

                            thickness: 1,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(right: 20, left: 10),
                                  child: Icon(
                                    Icons.logout,
                                    color: Constants.primaryColor,
                                  )),
                              InkWell(onTap: (){Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => SignInScreen()),
                              );},
                                child: Text(
                                  "Logout",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                          /*  Divider(
                            height: 20,
                            thickness: 1,
                            color: Colors.grey,
                          ),*/
                          SizedBox(
                            height: 40,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              );
            }
            return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Container(
                alignment: Alignment.center,
                child: CircularProgressIndicator(
                  color: Constants.primaryColor,
                ),
              ),
            );
          }),
    );
  }
}
