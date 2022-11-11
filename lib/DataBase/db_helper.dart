import 'package:intermediate/model/products.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

const String columnId_product = 'id';
const String columnId = 'id_table';
//const String columnName = 'name';
//const String columnIsChecked_fav = 'isChecked';
const String Table = 'cart_table';
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
              'create table $Table($columnId integer primary key autoincrement   ,$columnId_product integer )');
        });
  }

    add_info(Products product) async {
    await db.insert(Table,product.toMap());
    return product;
  }
  Future<int> removeproduct(int id) async {
    return await db.delete(
      Table,
      where: '$columnId',
      whereArgs: [id],
    );
  }
  Future<List<Products>> allproducts()async{
    List<Map<String, dynamic>> cart_asmaps = await db.query(Table);
    if (cart_asmaps.length == 0)
      return [];
    else {
      List<Products> all_cart = [];
      cart_asmaps.forEach((element) {
        all_cart.add(Products.fromMap(element));
      });
      return all_cart;
    }

  }
}