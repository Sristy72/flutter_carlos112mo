import 'dart:convert';

class AuthRequestModel {
  final String email;
  final String password;

  AuthRequestModel({
    required this.email,
    required this.password,
  });

  factory AuthRequestModel.fromJson(Map<String, dynamic> json) {
    return AuthRequestModel(
      email: json['email'] ?? '',
      password: json['password'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }

  static AuthRequestModel fromJsonString(String jsonString) =>
      AuthRequestModel.fromJson(json.decode(jsonString));

  String toJsonString() => json.encode(toJson());
}
