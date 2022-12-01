import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../model/user.dart';
import '../../network/userAPI.dart';

class PaymentScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int? val;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
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
          "Checkout",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
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
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "Checkout",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    height: 150,
                    color: Constants.thirdColor,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 15.0),
                                child: Text(
                                  "Shipping Address",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Icon(
                                Icons.edit,
                                color: Constants.secondryColor,
                              )
                            ],
                          ),
                          Text(
                            snapShot.data!.users![0].address!.number
                                    .toString() +
                                ',' +
                                snapShot.data!.users![0].address!.street
                                    .toString() +
                                ',' +
                                snapShot.data!.users![0].address!.city
                                    .toString(),
                            style: TextStyle(
                                color: Colors.black26,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1),
                          ),
                          Text(
                            snapShot.data!.users![0].phone.toString(),
                            style: TextStyle(
                                color: Colors.black26,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    color: Constants.thirdColor,
                    child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 15.0),
                                child: Text(
                                  "Payment Methods",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Column(
                                children: [
                                  RadioListTile(
                                    value: 1,
                                    groupValue: val,
                                    onChanged: (value) {
                                      setState(() {
                                        val = value as int?;
                                      });
                                    },
                                    activeColor: Constants.primaryColor,
                                    title: Text("Mastercard"),
                                  ),
                                  RadioListTile(
                                    value: 2,
                                    groupValue: val,
                                    onChanged: (value) {
                                      setState(() {
                                        val = value as int?;
                                      });
                                    },
                                    activeColor: Constants.primaryColor,
                                    title: Text("Wallet"),
                                  ),
                                  RadioListTile(
                                    value: 3,
                                    groupValue: val,
                                    onChanged: (value) {
                                      setState(() {
                                        val = value as int?;
                                      });
                                    },
                                    activeColor: Constants.primaryColor,
                                    title: Text("Cash on delivary"),
                                  )
                                ],
                              )
                            ])),
                  ),
                  SizedBox(
                    height: 30,
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
                        child: Text('Confirm Order'),
                      ),
                    ),
                  ),
                ],
              ),
            ); }
            return Center(child: Container(
              child: CircularProgressIndicator(
                color: Constants.primaryColor,
              ),
            ),);
          }),
    );
  }
}
