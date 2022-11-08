class Rating {
  late double? rate;
  late int? count;
  Rating({
    required this.count,
    required this.rate,
  });
  Rating.fromMap(Map<String, dynamic> map) {
    this.rate = map['rate'];
    this.count = map['count'];
  }
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "rate": this.rate,
      "count": this.count,
    };
    return map;
  }
}
