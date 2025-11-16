class SingleFieldsResponseModel {
  final String id;
  final String fieldName;
  final String description;
  final String fieldType;
  final double pricePerHour;
  final Location location;
  final ServicesAmenities servicesAmenities;
  final Rating rating;
  final List<FieldImage> images;
  final Owner owner;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  SingleFieldsResponseModel({
    required this.id,
    required this.fieldName,
    required this.description,
    required this.fieldType,
    required this.pricePerHour,
    required this.location,
    required this.servicesAmenities,
    required this.rating,
    required this.images,
    required this.owner,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory SingleFieldsResponseModel.fromJson(Map<String, dynamic> json) {
    return SingleFieldsResponseModel(
      id: json['_id'],
      fieldName: json['fieldName'],
      description: json['description'],
      fieldType: json['fieldType'],
      pricePerHour: (json['pricePerHour'] as num).toDouble(),
      location: Location.fromJson(json['location']),
      servicesAmenities: ServicesAmenities.fromJson(json['servicesAmenities']),
      rating: Rating.fromJson(json['rating']),
      images: (json['images'] as List)
          .map((e) => FieldImage.fromJson(e))
          .toList(),
      owner: Owner.fromJson(json['owner']),
      isActive: json['isActive'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      v: json['__v'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'fieldName': fieldName,
      'description': description,
      'fieldType': fieldType,
      'pricePerHour': pricePerHour,
      'location': location.toJson(),
      'servicesAmenities': servicesAmenities.toJson(),
      'rating': rating.toJson(),
      'images': images.map((e) => e.toJson()).toList(),
      'owner': owner.toJson(),
      'isActive': isActive,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      '__v': v,
    };
  }
}

class Location {
  final Coordinates coordinates;
  final String address;
  final String? mapUrl;

  Location({
    required this.coordinates,
    required this.address,
    this.mapUrl,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      coordinates: Coordinates.fromJson(json['coordinates']),
      address: json['address'],
      mapUrl: json['mapUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'coordinates': coordinates.toJson(),
      'address': address,
      'mapUrl': mapUrl,
    };
  }
}

class Coordinates {
  final double latitude;
  final double longitude;

  Coordinates({
    required this.latitude,
    required this.longitude,
  });

  factory Coordinates.fromJson(Map<String, dynamic> json) {
    return Coordinates(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}

class ServicesAmenities {
  final bool showers;
  final bool lights;
  final bool parking;
  final bool changingRooms;
  final bool cafe;
  final bool equipmentRental;

  ServicesAmenities({
    required this.showers,
    required this.lights,
    required this.parking,
    required this.changingRooms,
    required this.cafe,
    required this.equipmentRental,
  });

  factory ServicesAmenities.fromJson(Map<String, dynamic> json) {
    return ServicesAmenities(
      showers: json['showers'],
      lights: json['lights'],
      parking: json['parking'],
      changingRooms: json['changingRooms'],
      cafe: json['cafe'],
      equipmentRental: json['equipmentRental'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'showers': showers,
      'lights': lights,
      'parking': parking,
      'changingRooms': changingRooms,
      'cafe': cafe,
      'equipmentRental': equipmentRental,
    };
  }
}

class Rating {
  final double average;
  final int count;

  Rating({
    required this.average,
    required this.count,
  });

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      average: (json['average'] as num).toDouble(),
      count: json['count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'average': average,
      'count': count,
    };
  }
}

class FieldImage {
  final String url;
  final String originalName;
  final DateTime uploadDate;
  final String id;

  FieldImage({
    required this.url,
    required this.originalName,
    required this.uploadDate,
    required this.id,
  });

  factory FieldImage.fromJson(Map<String, dynamic> json) {
    return FieldImage(
      url: json['url'],
      originalName: json['originalName'],
      uploadDate: DateTime.parse(json['uploadDate']),
      id: json['_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'originalName': originalName,
      'uploadDate': uploadDate.toIso8601String(),
      '_id': id,
    };
  }
}

class Owner {
  final String id;
  final String name;
  final String email;

  Owner({
    required this.id,
    required this.name,
    required this.email,
  });

  factory Owner.fromJson(Map<String, dynamic> json) {
    return Owner(
      id: json['_id'],
      name: json['name'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'email': email,
    };
  }
}
