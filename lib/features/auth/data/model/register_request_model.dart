class RegisterRequestModel {
  final String name;
  final String email;
  final String password;
  final String role;

  RegisterRequestModel({
    required this.name,
    required this.email,
    required this.password,
    required this.role,
  });

  factory RegisterRequestModel.fromJson(Map<String, dynamic> json) {
    return RegisterRequestModel(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      role: json['role'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'role': role,
    };
  }
}
