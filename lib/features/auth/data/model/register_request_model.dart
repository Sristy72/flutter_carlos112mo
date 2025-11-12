import 'dart:convert';

class RegisterRequestModel {
  final String name;
  final String email;
  final String password;

  RegisterRequestModel({
    required this.name,
    required this.email,
    required this.password,
  });

  factory RegisterRequestModel.fromJson(Map<String, dynamic> json) {
    return RegisterRequestModel(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
    };
  }

  static RegisterRequestModel fromJsonString(String jsonString) =>
      RegisterRequestModel.fromJson(json.decode(jsonString));

  String toJsonString() => json.encode(toJson());
}
