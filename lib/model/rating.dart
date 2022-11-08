class Rating {
  late double rate;
  late int count;

  Rating({
    required this.rate,
    required this.count,
  });

  Rating.FromJson(Map<String, dynamic> map) {
    this.rate = map["rate"];
    this.count = map["count"];
  }

  Map<String, dynamic> ToJson() {
    Map<String, dynamic> map = {
      "rate": this.rate,
      "count": this.count,
    };
    return map;
  }
}
