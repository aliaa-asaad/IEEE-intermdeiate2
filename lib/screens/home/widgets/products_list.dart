import 'package:flutter/material.dart';
import '../../../constants.dart';

class ProductsList extends StatelessWidget {
  final String? price;
  final String? name;
  final String? image;

  const ProductsList({this.price, this.name, this.image});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 145,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                    image: NetworkImage(
                      image!,
                    ),
                    fit: BoxFit.fill),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      name!,
                      style: TextStyle(fontSize: 15),
                    ),
                    Text(
                      price!,
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  child: Icon(
                    Icons.add,
                    size: 15,
                    color: Colors.white,
                  ),
                  decoration: BoxDecoration(
                    color: Constants.primaryColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                )
              ],
            )
          ],
        ),
        alignment: Alignment.center,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Constants.thirdColor,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
