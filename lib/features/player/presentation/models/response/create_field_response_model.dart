class FieldResponse {
  final String id;
  final String fieldName;
  final String description;
  final String fieldType;
  final double pricePerHour;
  final Location location;
  final ServicesAmenities servicesAmenities;
  final List<FieldImage> images;
  final String owner;
  final bool isActive;
  final Rating rating;
  final DateTime createdAt;
  final DateTime updatedAt;

  FieldResponse({
    required this.id,
    required this.fieldName,
    required this.description,
    required this.fieldType,
    required this.pricePerHour,
    required this.location,
    required this.servicesAmenities,
    required this.images,
    required this.owner,
    required this.isActive,
    required this.rating,
    required this.createdAt,
    required this.updatedAt,
  });

  factory FieldResponse.fromJson(Map<String, dynamic> json) {
    return FieldResponse(
      id: json['_id'],
      fieldName: json['fieldName'],
      description: json['description'],
      fieldType: json['fieldType'],
      pricePerHour: (json['pricePerHour'] as num).toDouble(),
      location: Location.fromJson(json['location']),
      servicesAmenities: ServicesAmenities.fromJson(json['servicesAmenities']),
      images: (json['images'] as List)
          .map((e) => FieldImage.fromJson(e))
          .toList(),
      owner: json['owner'],
      isActive: json['isActive'],
      rating: Rating.fromJson(json['rating']),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() => {
    '_id': id,
    'fieldName': fieldName,
    'description': description,
    'fieldType': fieldType,
    'pricePerHour': pricePerHour,
    'location': location.toJson(),
    'servicesAmenities': servicesAmenities.toJson(),
    'images': images.map((e) => e.toJson()).toList(),
    'owner': owner,
    'isActive': isActive,
    'rating': rating.toJson(),
    'createdAt': createdAt.toIso8601String(),
    'updatedAt': updatedAt.toIso8601String(),
  };
}

class Location {
  final String address;
  final Coordinates coordinates;
  final String? mapUrl;

  Location({required this.address, required this.coordinates, this.mapUrl});

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    address: json['address'],
    coordinates: Coordinates.fromJson(json['coordinates']),
    mapUrl: json['mapUrl'],
  );

  Map<String, dynamic> toJson() => {
    'address': address,
    'coordinates': coordinates.toJson(),
    'mapUrl': mapUrl,
  };
}

class Coordinates {
  final double latitude;
  final double longitude;

  Coordinates({required this.latitude, required this.longitude});

  factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
    latitude: (json['latitude'] as num).toDouble(),
    longitude: (json['longitude'] as num).toDouble(),
  );

  Map<String, dynamic> toJson() => {
    'latitude': latitude,
    'longitude': longitude,
  };
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

  factory ServicesAmenities.fromJson(Map<String, dynamic> json) =>
      ServicesAmenities(
        showers: json['showers'],
        lights: json['lights'],
        parking: json['parking'],
        changingRooms: json['changingRooms'],
        cafe: json['cafe'],
        equipmentRental: json['equipmentRental'],
      );

  Map<String, dynamic> toJson() => {
    'showers': showers,
    'lights': lights,
    'parking': parking,
    'changingRooms': changingRooms,
    'cafe': cafe,
    'equipmentRental': equipmentRental,
  };
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

  factory FieldImage.fromJson(Map<String, dynamic> json) => FieldImage(
    url: json['url'],
    originalName: json['originalName'],
    uploadDate: DateTime.parse(json['uploadDate']),
    id: json['_id'],
  );

  Map<String, dynamic> toJson() => {
    'url': url,
    'originalName': originalName,
    'uploadDate': uploadDate.toIso8601String(),
    '_id': id,
  };
}

class Rating {
  final double average;
  final int count;

  Rating({required this.average, required this.count});

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
    average: (json['average'] as num).toDouble(),
    count: json['count'],
  );

  Map<String, dynamic> toJson() => {
    'average': average,
    'count': count,
  };
}
