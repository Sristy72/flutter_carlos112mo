import 'dart:convert';

class AuthResponseModel {
  final String accessToken;
  final String refreshToken;
  final String role;
  final String id;
  final User user;

  AuthResponseModel({
    required this.accessToken,
    required this.refreshToken,
    required this.role,
    required this.id,
    required this.user,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
      accessToken: json['accessToken'] ?? '',
      refreshToken: json['refreshToken'] ?? '',
      role: json['role'] ?? '',
      id: json['_id'] ?? '',
      user: User.fromJson(json['user'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'accessToken': accessToken,
      'refreshToken': refreshToken,
      'role': role,
      '_id': id,
      'user': user.toJson(),
    };
  }

  static AuthResponseModel fromJsonString(String jsonString) =>
      AuthResponseModel.fromJson(json.decode(jsonString));

  String toJsonString() => json.encode(toJson());
}

class User {
  final Avatar avatar;
  final Location location;
  final VerificationInfo verificationInfo;
  final String id;
  final String name;
  final String email;
  final String password;
  final String role;
  final String status;
  final String passwordResetToken;
  final String refreshToken;
  final double averageRating;
  final int ratingCount;
  final DateTime lastActive;
  final DateTime dob;
  final List<dynamic> ratings;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  User({
    required this.avatar,
    required this.location,
    required this.verificationInfo,
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.role,
    required this.status,
    required this.passwordResetToken,
    required this.refreshToken,
    required this.averageRating,
    required this.ratingCount,
    required this.lastActive,
    required this.dob,
    required this.ratings,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      avatar: Avatar.fromJson(json['avatar'] ?? {}),
      location: Location.fromJson(json['location'] ?? {}),
      verificationInfo:
          VerificationInfo.fromJson(json['verificationInfo'] ?? {}),
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      role: json['role'] ?? '',
      status: json['status'] ?? '',
      passwordResetToken: json['password_reset_token'] ?? '',
      refreshToken: json['refreshToken'] ?? '',
      averageRating: (json['averageRating'] ?? 0).toDouble(),
      ratingCount: json['ratingCount'] ?? 0,
      lastActive: DateTime.tryParse(json['lastActive'] ?? '') ??
          DateTime.fromMillisecondsSinceEpoch(0),
      dob: DateTime.tryParse(json['dob'] ?? '') ??
          DateTime.fromMillisecondsSinceEpoch(0),
      ratings: List<dynamic>.from(json['ratings'] ?? []),
      createdAt: DateTime.tryParse(json['createdAt'] ?? '') ??
          DateTime.fromMillisecondsSinceEpoch(0),
      updatedAt: DateTime.tryParse(json['updatedAt'] ?? '') ??
          DateTime.fromMillisecondsSinceEpoch(0),
      v: json['__v'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'avatar': avatar.toJson(),
      'location': location.toJson(),
      'verificationInfo': verificationInfo.toJson(),
      '_id': id,
      'name': name,
      'email': email,
      'password': password,
      'role': role,
      'status': status,
      'password_reset_token': passwordResetToken,
      'refreshToken': refreshToken,
      'averageRating': averageRating,
      'ratingCount': ratingCount,
      'lastActive': lastActive.toIso8601String(),
      'dob': dob.toIso8601String(),
      'ratings': ratings,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      '__v': v,
    };
  }
}

class Avatar {
  final String publicId;
  final String url;

  Avatar({
    required this.publicId,
    required this.url,
  });

  factory Avatar.fromJson(Map<String, dynamic> json) {
    return Avatar(
      publicId: json['public_id'] ?? '',
      url: json['url'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'public_id': publicId,
        'url': url,
      };
}

class Location {
  final String type;
  final List<double> coordinates;

  Location({
    required this.type,
    required this.coordinates,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      type: json['type'] ?? '',
      coordinates: (json['coordinates'] as List?)
              ?.map((e) => (e as num).toDouble())
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() => {
        'type': type,
        'coordinates': coordinates,
      };
}

class VerificationInfo {
  final bool verified;
  final String token;

  VerificationInfo({
    required this.verified,
    required this.token,
  });

  factory VerificationInfo.fromJson(Map<String, dynamic> json) {
    return VerificationInfo(
      verified: json['verified'] ?? false,
      token: json['token'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'verified': verified,
        'token': token,
      };
}
