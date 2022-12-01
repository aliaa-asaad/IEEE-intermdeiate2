import 'package:Thermo_App/DataBase/database_modal.dart';
import 'package:Thermo_App/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../naviagtion/navigation_bar.dart';
import '/../network/productsAPI.dart';
import '/../DataBase/db_helper.dart';
import '../../model/products.dart';

class DetailsScreen extends StatefulWidget {
  var id;

  DetailsScreen({Key? key, this.id}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int counter = 1;

  void decrement() {
    if (counter <= 0) {
      counter = 0;
    } else
      counter--;
  }

  DbHelper? helper;

  @override
  void initState() {
    helper = DbHelper();
    // widget.id=int.parse(ModalRoute.of(context).settings.arguments);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    widget.id = ModalRoute.of(context)!.settings.arguments as Map<String, int?>;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,

          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => NavigationScreen()));
            },
            icon: Icon(Icons.arrow_back_ios_new,color: Constants.primaryColor,),
          ),
        ),
        body: FutureBuilder<Products>(
          future: ProductsApi().getSingleProduct(widget.id['id'].toString()),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(snapshot.data!.image!),
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                              ),
                            ),
                            height: 350,
                            width: 380,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 6,
                                color: Constants.primaryColor,
                              ),
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0, left: 25),
                        child: Text(snapshot.data!.title.toString(),
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
                                  color: Constants.thirdColor,
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
                                          color: Constants.primaryColor,
                                          borderRadius: BorderRadius.circular(3),
                                        ),
                                        child: Center(
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.white,
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
                                        color: Constants.primaryColor,
                                        borderRadius: BorderRadius.circular(3),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        children: [
                                          GestureDetector(
                                            child: Icon(
                                              Icons.remove,
                                              color: Colors.white,
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
                                '${counter * snapshot.data!.price!.round()} \$',
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
                          '${snapshot.data!.description!}',
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
                          onTap: () async {
                            /*await helper!.add_info(Helper_Product_Details(
                              product_id: widget.id['id'],
                              title: snapshot.data!.title.toString(),
                              image: snapshot.data!.image.toString(),
                              price: snapshot.data!.price!,
                              rate: snapshot.data!.rating!.rate!,
                            ));*/
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NavigationScreen()));
                            print(await helper!.allproducts());
                          },
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
                    ]),
              );
            }
            if (snapshot.hasError) {
              print(snapshot.error!);
              return Center(
                child: Text('${snapshot.error}'),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}