const String columnId = 'idtable';
const String column_Id_Product = 'id';
const String columnImage = 'image';
const String columnTitle = 'title';
const String columnPrice = 'price';
const String columnRate = 'rate';
const String Table = 'cart_table';

class Helper_Product_Details {
  int? id;
  late int product_id;
  late String image;
  late String title;
  late double price;
  late double rate;

  Helper_Product_Details({
    this.id,
    required this.product_id,
    required this.title,
    required this.image,
    required this.price,
    required this.rate,
  });

  Helper_Product_Details.fromMap(Map<String, dynamic> inmap) {
    if (inmap[columnId] != null) {
      this.id = inmap[columnId];
    }
    this.title = inmap[columnTitle];
    this.image = inmap[columnImage];
    this.price = inmap[columnPrice];
    this.rate = inmap[columnRate];
    this.product_id = inmap[column_Id_Product];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (this.id != null) {
      map[columnId] = this.id;
    }
    map[column_Id_Product] = this.product_id;
    map[columnTitle]=this.title;
    map[columnImage]=this.image;
    map[columnPrice]=this.price;
    map[columnRate]=this.rate;
    return map;
  }
}
