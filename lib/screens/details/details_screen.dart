import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Thermo_App/model/products.dart';
import 'package:Thermo_App/network/productsAPI.dart';

class DetailsScreen extends StatefulWidget {
  DetailsScreen({Key? key}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  Color sizecolor = Color(0xff2a2a2a);

  int imagecount = 1;

  int counter = 1;

  void decrement() {
    if (counter <= 0) {
      counter = 0;
    } else
      counter--;
  }

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as Map<String,int?>;
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<Products>(
            future: ProductsApi().getSingleProduct(productId['id'].toString()),
            builder: ((context, snapshot) {
              if (snapshot.hasData)
                return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(snapshot.data!.image!),
                                    fit: BoxFit.scaleDown),
                              ),
                            ),
                          ),
                          height: 350,
                          width: 380,
                          decoration: BoxDecoration(
                            color: Color(0xffffdb2e),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0, left: 25),
                        child: Text('Modern Chair',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w500)),
                      ),
                      Card(
                        elevation: 0.5,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 100,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    GestureDetector(
                                      child: Container(
                                        width: 25,
                                        height: 25,
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(3),
                                        ),
                                        child: Center(
                                            child: Icon(
                                          Icons.add,
                                          color: Color(0xffff7b00),
                                        )),
                                      ),
                                      onTap: () {
                                        setState(() {
                                          counter++;
                                        });
                                      },
                                    ),
                                    Text(
                                      '$counter',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 23,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(
                                      width: 25,
                                      height: 25,
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.circular(3),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          GestureDetector(
                                            child: Icon(
                                              Icons.remove,
                                              color: Color(0xffff7b00),
                                            ),
                                            onTap: () {
                                              setState(() {
                                                decrement();
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                '${counter * 120} \$',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffff7b00),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0, top: 12),
                        child: Text(
                          'Product Details',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          'All writers love language. And we especially love fun, amazing words, don’t we? Some have funky spellings, tongue-twisting turns, a satisfying “ooh”…and some sound too hilarious to be true! So I’ve put together',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w300),
                        ),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 60),
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            child: Center(
                                child: Text(
                              'Add To Cart',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            )),
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Color(0xffff7b00),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      )
                    ]);
              if (snapshot.hasError) {
                print(snapshot.error);
                return Text(snapshot.error.toString());
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            })),
      ),
    );
  }
}
/*

*/
