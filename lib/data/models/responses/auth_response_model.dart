import 'dart:convert';

class AuthResponseModel {
  final User user;
  final String accessToken;

  AuthResponseModel({
    required this.user,
    required this.accessToken,
  });

  factory AuthResponseModel.fromJson(String str) =>
      AuthResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AuthResponseModel.fromMap(Map<String, dynamic> json) =>
      AuthResponseModel(
        user: User.fromMap(json["user"]),
        accessToken: json["access_token"],
      );

  Map<String, dynamic> toMap() => {
        "user": user.toMap(),
        "access_token": accessToken,
      };
}

class User {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String roles;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.roles,
  });

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        roles: json["roles"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "roles": roles,
      };
}
