class RegisterResponseModel {
  final String id;
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
  final DateTime lastActive;
  final DateTime dob;
  final List<dynamic> ratings;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;
  final String accessToken;

  RegisterResponseModel({
    required this.id,
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
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      avatar: Avatar.fromJson(json['avatar'] ?? {}),
      role: json['role'] ?? '',
      location: Location.fromJson(json['location'] ?? {}),
      status: json['status'] ?? '',
      verificationInfo: VerificationInfo.fromJson(json['verificationInfo'] ?? {}),
      passwordResetToken: json['password_reset_token'] ?? '',
      refreshToken: json['refreshToken'] ?? '',
      averageRating: (json['averageRating'] ?? 0).toDouble(),
      ratingCount: json['ratingCount'] ?? 0,
      lastActive: DateTime.parse(json['lastActive'] ?? DateTime.now().toIso8601String()),
      dob: DateTime.parse(json['dob'] ?? DateTime.now().toIso8601String()),
      ratings: List<dynamic>.from(json['ratings'] ?? []),
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toIso8601String()),
      updatedAt: DateTime.parse(json['updatedAt'] ?? DateTime.now().toIso8601String()),
      v: json['__v'] ?? 0,
      accessToken: json['accessToken'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
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
      'lastActive': lastActive.toIso8601String(),
      'dob': dob.toIso8601String(),
      'ratings': ratings,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      '__v': v,
      'accessToken': accessToken,
    };
  }
}

class Avatar {
  final String publicId;
  final String url;

  Avatar({required this.publicId, required this.url});

  factory Avatar.fromJson(Map<String, dynamic> json) {
    return Avatar(
      publicId: json['public_id'] ?? '',
      url: json['url'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'public_id': publicId,
      'url': url,
    };
  }
}

class Location {
  final String type;
  final List<double> coordinates;

  Location({required this.type, required this.coordinates});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      type: json['type'] ?? '',
      coordinates: (json['coordinates'] != null)
          ? List<double>.from(json['coordinates'].map((x) => (x as num).toDouble()))
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'coordinates': coordinates,
    };
  }
}

class VerificationInfo {
  final bool verified;
  final String token;

  VerificationInfo({required this.verified, required this.token});

  factory VerificationInfo.fromJson(Map<String, dynamic> json) {
    return VerificationInfo(
      verified: json['verified'] ?? false,
      token: json['token'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'verified': verified,
      'token': token,
    };
  }
}
