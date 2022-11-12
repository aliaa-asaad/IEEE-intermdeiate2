import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Thermo_App/constants.dart';
import 'package:Thermo_App/model/products.dart';
import 'package:Thermo_App/network/categoriesAPI.dart';
import 'package:Thermo_App/screens/home/widgets/categories_list.dart';
import 'package:Thermo_App/screens/home/widgets/products_list.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int indexCategory = -1;
  List indexList = [0, 1, 2, 3];
  String category = '';

  @override
  Widget build(BuildContext context) {
    List categories = [
      "men's clothing",
      "women's clothing",
      "jewelery",
      "electronics"
    ];

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
                        function: () {
                          setState(() {
                            indexCategory = indexList[index];
                            category = categories[index];
                          });
                        },
                        borderColor: indexCategory == indexList[index]
                            ? Constants.primaryColor
                            : Colors.grey.shade300,
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
              child: FutureBuilder<ProductsData>(
                  future: CategoryApi().getApiData(category),
                  builder: (context, snapshot) {
                    if (snapshot.hasData)
                      return Container(
                        child: GridView.builder(
                          itemBuilder: (context, index) => ProductsList(
                            id: snapshot.data!.products![index].id!.toInt(),
                            name: snapshot.data!.products![index].title!,
                            price: snapshot.data!.products![index].price!
                                .toDouble(),
                            image: snapshot.data!.products![index].image,
                          ),
                          itemCount: snapshot.data!.products!.length,
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 200,
                                  crossAxisSpacing: 20,
                                  childAspectRatio: 3 / 4,
                                  mainAxisSpacing: 20),
                        ),
                      );
                    if (snapshot.hasError) {
                      print(snapshot.error!);
                      return Container(
                        child: Text(snapshot.error!.toString()),
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
            ),
          ],
        ),
      )),
    );
  }
}
