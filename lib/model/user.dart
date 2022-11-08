class User {
  List<Address>? address;
  int? id;
  String? email;
  String? username;
  String? password;
  List<Name>? name;
  int? phone;

  User({
    this.address,
    this.id,
    this.email,
    this.username,
    this.password,
    this.name,
    this.phone,
  });

  User.fromMap(Map<String, dynamic> map) {
    address = [];
    ((map['address']) as List<dynamic>).forEach((element) {
      address!.add(Address.fromMap(element));
    });
    this.id = map['id'];
    this.email = map['email'];
    this.username = map['username'];
    this.password = map['password'];
    name = [];
    ((map['name']) as List<dynamic>).forEach((element) {
      name!.add(Name.fromMap(element));
    });
    this.phone = map['phone'];
  }

  Map<String, dynamic> toMap() {
    List<Map> addressList = [];
    address!.forEach((element) => addressList.add(element.toMap()));
    List<Map> nameList = [];
    name!.forEach((element) => nameList.add(element.toMap()));
    Map<String, dynamic> map = {
      'address': addressList,
      'id': this.id,
      'email': this.email,
      'username': this.username,
      'password': this.password,
      'name': nameList,
      'phone': this.phone,
    };
    return map;
  }
}

class Address {
  String? city;
  String? street;
  int? number;

  Address({
    this.city,
    this.street,
    this.number,
  });

  Address.fromMap(Map<String, dynamic> map) {
    this.city = map['city'];
    this.street = map['street'];
    this.number = map['number'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'city': this.city,
      'street': this.street,
      'number': this.number
    };
    return map;
  }
}

class Name {
  String? firstname;
  String? lastname;

  Name({
    this.firstname,
    this.lastname,
  });

  Name.fromMap(Map<String, dynamic> map) {
    this.firstname = map['firstname'];
    this.lastname = map['lastname'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'firstname': this.firstname,
      'lastname': this.lastname,
    };
    return map;
  }
}
