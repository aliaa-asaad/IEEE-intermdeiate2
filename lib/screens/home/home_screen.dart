import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intermediate/model/products.dart';
import 'package:intermediate/network/productsAPI.dart';
import 'package:intermediate/screens/home/widgets/categories_list.dart';
import 'package:intermediate/screens/home/widgets/products_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List categories = ["men's clothing", "women's clothing", "jewelery", "electronics"];
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
                        text: categories[index],
                      ),
                  separatorBuilder: (context, index) => SizedBox(
                        width: 10,
                      ),
                  itemCount: categories.length),
            ),
            SizedBox(height: 30),
            Text(
              'Products',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(
              child: FutureBuilder <ProductsData>(future: ProductsApi().getProductData(),
                builder:(context, snapshot) {
                  if(snapshot.hasData) return Container(
                  child: GridView.builder(
                    itemBuilder: (context, index) => ProductsList(
                      name: snapshot.data!.products![index].title!,
                      price: snapshot.data!.products![index].price!,
                      image:
                      snapshot.data!.products![index].image,
                    ),
                    itemCount: categories.length,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        crossAxisSpacing: 20,
                        childAspectRatio: 3 / 4,
                        mainAxisSpacing: 20),
                  ),
                );
                  if (snapshot.hasError) {
                    return Container(
                      child: Text(snapshot.error!.toString()),
                    );
                  }
                  return  Center(
                    child: CircularProgressIndicator(),
                  );
                }
              ),
            ),
          ],
        ),
      )),
    );
  }
}
