class Rating {
  late double? rate;
  late int? count;
  Rating({
    required this.count,
    required this.rate,
  });
  Rating.fromMap(Map<String, dynamic> map) {
    this.rate = double.parse(map['rate'].toString());
    this.count = int.parse(map['count'].toString());
  }
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "rate": this.rate,
      "count": this.count,
    };
    return map;
  }
}
