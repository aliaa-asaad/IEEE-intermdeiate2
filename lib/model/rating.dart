class Rating {
  late double? rate;
  late int? count;
  Rating({
    required this.count,
    required this.rate,
  });
  Rating.fromMap(Map<String, dynamic> map) {
    print('11');
    this.rate = map['rate'];
    print('12');
    this.count = map['count'];
    print('13');
  }
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "rate": this.rate,
      "count": this.count,
    };
    return map;
  }
}
