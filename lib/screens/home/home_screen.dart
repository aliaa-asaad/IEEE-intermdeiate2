import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intermediate/screens/home/widgets/categories_list.dart';
import 'package:intermediate/screens/home/widgets/products_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List te = ['men\'s clothing', 'women\'s clothing', 'asaad', 'test','men\'s clothing', 'women\'s clothing',];
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Text(
              'Categories',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => CategoriesList(
                        text: te[index],
                      ),
                  separatorBuilder: (context, index) => SizedBox(
                        width: 10,
                      ),
                  itemCount: te.length),
            ),
            SizedBox(height: 30),
            Text(
              'Products',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                child: GridView.builder(
                  itemBuilder: (context, index) => ProductsList(
                    name: te[index],
                    price: te[index],
                    image:
                        'https://th.bing.com/th/id/OIP.j38sGXHOPs8wDf0sGbaRGAHaED?pid=ImgDet&rs=1',
                  ),
                  itemCount: te.length,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      crossAxisSpacing: 20,
                      childAspectRatio: 3 / 4,
                      mainAxisSpacing: 20),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
