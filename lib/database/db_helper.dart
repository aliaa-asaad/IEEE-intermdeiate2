import '/../model/products.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'database_modal.dart';

//const String columnId_product = 'id';
////const String columnId = 'id_table';
//const String Table = 'cart_table';
class DbHelper {
  late Database db;
  static final DbHelper instance = DbHelper._internal();

  factory DbHelper() {
    return instance;
  }
  DbHelper._internal();

  Future opendatabase() async {
    var databasesPath = await getDatabasesPath();
    String path = await join(databasesPath, 'db_ecommerce');
    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int v) async {
          db.execute(
              'create table $Table($columnId integer primary key autoincrement,$column_Id_Product integer not null)');
        });
  }

   Future<Helper_Product_Details> add_info(Helper_Product_Details product) async {
    await db.insert(Table,product.toMap());
    return product;
  }
  Future<int> removeproduct(int id) async {
    return await db.delete(
      Table,
      where: columnId,
      whereArgs: [id],
    );
  }
  Future<List<Helper_Product_Details>> allproducts()async{
    List<Map<String, dynamic>> cart_asmaps = await db.query(Table);
    if (cart_asmaps.length == 0)
      return [];
    else {
      List<Helper_Product_Details> all_cart = [];
      cart_asmaps.forEach((element) {
        all_cart.add(Helper_Product_Details.fromMap(element));
      });
      return all_cart;
    }

  }
  Future<int> UpdateProduct(Helper_Product_Details p)async{
    return await db.update(Table, p.toMap());

  }
}