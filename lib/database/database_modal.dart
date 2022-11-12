
const String columnId = 'idtable';
const String column_Id_Product = 'id';
const String Table = 'cart_table';
class Helper_Product_Details {
  int? id;
  late int product_id;
  Helper_Product_Details({
    this.id,
    required this.product_id,
  });
  Helper_Product_Details.fromMap(Map<String, dynamic> inmap) {
    if (inmap[columnId] != null) {
      this.id = inmap[columnId];
    }
    this.product_id = inmap[column_Id_Product];
  }
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (this.id != null) {
      map[columnId] = this.id;
    }
    map[column_Id_Product] = this.product_id;
    return map;
  }
}