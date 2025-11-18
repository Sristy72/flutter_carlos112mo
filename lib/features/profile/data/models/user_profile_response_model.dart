class UserProfileResponseModel {
  Avatar? avatar;
  Location? location;
  String? sId;
  String? name;
  String? email;
  String? role;
  String? status;
  int? averageRating;
  int? ratingCount;
  String? lastActive;
  String? dob;
  List<dynamic>? ratings;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? favoriteClub;
  int? age;
  String? position;
  String? phone;

  UserProfileResponseModel(
      {this.avatar,
        this.location,
        this.sId,
        this.name,
        this.email,
        this.role,
        this.status,
        this.averageRating,
        this.ratingCount,
        this.lastActive,
        this.dob,
        this.ratings,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.favoriteClub,
        this.age,
        this.position,
        this.phone});

  UserProfileResponseModel.fromJson(Map<String, dynamic> json) {
    avatar =
    json['avatar'] != null ? Avatar.fromJson(json['avatar']) : null;
    location = json['location'] != null
        ? Location.fromJson(json['location'])
        : null;
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    role = json['role'];
    status = json['status'];
    averageRating = json['averageRating'];
    ratingCount = json['ratingCount'];
    lastActive = json['lastActive'];
    dob = json['dob'];
    ratings = json['ratings'] ?? [];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    favoriteClub = json['FavoriteClub'];
    age = json['age'];
    position = json['position'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (avatar != null) {
      data['avatar'] = avatar!.toJson();
    }
    if (location != null) {
      data['location'] = location!.toJson();
    }
    data['_id'] = sId;
    data['name'] = name;
    data['email'] = email;
    data['role'] = role;
    data['status'] = status;
    data['averageRating'] = averageRating;
    data['ratingCount'] = ratingCount;
    data['lastActive'] = lastActive;
    data['dob'] = dob;
    data['ratings'] = ratings;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    data['FavoriteClub'] = favoriteClub;
    data['age'] = age;
    data['position'] = position;
    data['phone'] = phone;
    return data;
  }
}

class Avatar {
  String? publicId;
  String? url;

  Avatar({this.publicId, this.url});

  Avatar.fromJson(Map<String, dynamic> json) {
    publicId = json['public_id'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['public_id'] = publicId;
    data['url'] = url;
    return data;
  }
}

class Location {
  String? type;
  List<int>? coordinates;

  Location({this.type, this.coordinates});

  Location.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['coordinates'] = coordinates;
    return data;
  }
}