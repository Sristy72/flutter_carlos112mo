import 'dart:convert';

class RegisterResponseModel {
  final String name;
  final String email;
  final String password;
  final Avatar avatar;
  final String role;
  final Location location;
  final String status;
  final VerificationInfo verificationInfo;
  final String passwordResetToken;
  final String refreshToken;
  final double averageRating;
  final int ratingCount;
  final String id;
  final DateTime lastActive;
  final DateTime dob;
  final List<dynamic> ratings;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;
  final String accessToken;

  RegisterResponseModel({
    required this.name,
    required this.email,
    required this.password,
    required this.avatar,
    required this.role,
    required this.location,
    required this.status,
    required this.verificationInfo,
    required this.passwordResetToken,
    required this.refreshToken,
    required this.averageRating,
    required this.ratingCount,
    required this.id,
    required this.lastActive,
    required this.dob,
    required this.ratings,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.accessToken,
  });

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    return RegisterResponseModel(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      avatar: Avatar.fromJson(json['avatar'] ?? {}),
      role: json['role'] ?? '',
      location: Location.fromJson(json['location'] ?? {}),
      status: json['status'] ?? '',
      verificationInfo:
          VerificationInfo.fromJson(json['verificationInfo'] ?? {}),
      passwordResetToken: json['password_reset_token'] ?? '',
      refreshToken: json['refreshToken'] ?? '',
      averageRating: (json['averageRating'] ?? 0).toDouble(),
      ratingCount: json['ratingCount'] ?? 0,
      id: json['_id'] ?? '',
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
      accessToken: json['accessToken'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'avatar': avatar.toJson(),
      'role': role,
      'location': location.toJson(),
      'status': status,
      'verificationInfo': verificationInfo.toJson(),
      'password_reset_token': passwordResetToken,
      'refreshToken': refreshToken,
      'averageRating': averageRating,
      'ratingCount': ratingCount,
      '_id': id,
      'lastActive': lastActive.toIso8601String(),
      'dob': dob.toIso8601String(),
      'ratings': ratings,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      '__v': v,
      'accessToken': accessToken,
    };
  }

  static RegisterResponseModel fromJsonString(String jsonString) =>
      RegisterResponseModel.fromJson(json.decode(jsonString));
  String toJsonString() => json.encode(toJson());
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
