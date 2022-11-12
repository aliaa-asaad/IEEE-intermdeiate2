import 'package:flutter/material.dart';
import '../../../constants.dart';

class ProductsList extends StatelessWidget {
  final int? id;
  final double? price;
  final String? name;
  final String? image;

  const ProductsList({this.price, this.name, this.image, this.id});
  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed('details', arguments: {'id': id});
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>selectCategory(context),
      child: Container(
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: MediaQuery.of(context).size.height*0.17,//145,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                    image: NetworkImage(
                      image!,
                    ),
                    fit: BoxFit.contain),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              name!,
              style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),maxLines: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [

                    Text(
                      '\$$price',
                      style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.grey),
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
