class Users{
  List<User>? users;
  Users({this.users});
  Users.fromMap(List<dynamic> map) {
    users = [];
    ((map) as List<dynamic>).forEach((element) {
      users!.add(User.fromMap(element));
    });
  }

  Map<String, dynamic> toMap() {
    List<Map> userList = [];
    users!.forEach((element) => userList.add(element.toMap()));
    Map<String, dynamic> map = {'users': userList};

    return map;
  }
}
class User {
  Address? address;
  int? id;
  String? email;
  String? username;
  String? password;
  Name? name;
  String? phone;

  User({
    this.address,
    this.id,
    this.email,
    this.username,
    this.password,
    this.name,
    this.phone,

  });

  User.fromMap(Map<String,dynamic> map) {
    this.address = Address.fromMap(map['address']);
    this.id = map['id'];
    this.email = map['email'];
    this.username = map['username'];
    this.password = map['password'];
    this.name = Name.fromMap(map['name']);
    this.phone = map['phone'];
  }

  Map<String, dynamic> toMap() {

    Map<String, dynamic> map = {
      'address': this.address!.toMap(),
      'id': this.id,
      'email': this.email,
      'username': this.username,
      'password': this.password,
      'name': this.name!.toMap(),
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
    print("--11--");

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
