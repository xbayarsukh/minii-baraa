class User {
  int? id;
  String? firstname;
  String? lastname;
  String? phone;
  int? userType;

  User({
    this.id,
    this.lastname,
    this.firstname,
    this.phone,
    this.userType = 0,
  });

  factory User.fromMap(Map<String, dynamic> json) {
    return User(
      id: json["id"] as int,
      lastname: json["lastname"] as String,
      firstname: json["firstname"] as String,
      phone: json["phone"] as String,
      userType: json["is_driver"] as int,
    );
  }

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      "id": id!,
      "firstname": firstname!,
      "lastname": lastname!,
      "phone": phone!,
      "user_type": userType!,
    };
    return map;
  }
}
