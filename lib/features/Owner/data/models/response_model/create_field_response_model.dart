import 'dart:io';  // Added this import for File

class CreateFieldResponseModel {
  final String id;
  final String fieldName;
  final String description;
  final String fieldType;
  final bool promotion;
  final int basePricePerHour;
  final List<PricePerHour> pricePerHour;
  final Location location;
  final ServicesAmenities servicesAmenities;
  final List<File> images;            // Changed from List<ImageData> to List<File>
  final String owner;
  final bool isActive;
  final Rating rating;
  final String createdAt;
  final String updatedAt;

  CreateFieldResponseModel({
    required this.id,
    required this.fieldName,
    required this.description,
    required this.fieldType,
    required this.promotion,
    required this.basePricePerHour,
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

  factory CreateFieldResponseModel.fromJson(Map<String, dynamic> json) {
    return CreateFieldResponseModel(
      id: json['_id'],
      fieldName: json['fieldName'] ?? '',
      description: json['description'] ?? '',
      fieldType: json['fieldType'] ?? '',
      promotion: json['promotion'] ?? false,
      basePricePerHour: json['basePricePerHour'] ?? 0,
      pricePerHour: (json['pricePerHour'] as List<dynamic>?)
          ?.map((e) => PricePerHour.fromJson(e))
          .toList() ??
          [],
      location: Location.fromJson(json['location']),
      servicesAmenities:
      ServicesAmenities.fromJson(json['servicesAmenities']),
      images: [], // Cannot reconstruct File from JSON (local files). You may want to handle this differently when parsing from API.
      owner: json['owner'] ?? '',
      isActive: json['isActive'] ?? false,
      rating: Rating.fromJson(json['rating']),
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "fieldName": fieldName,
      "description": description,
      "fieldType": fieldType,
      "promotion": promotion,
      "basePricePerHour": basePricePerHour,
      "pricePerHour": pricePerHour.map((e) => e.toJson()).toList(),
      "location": location.toJson(),
      "servicesAmenities": servicesAmenities.toJson(),
      // Note: Files cannot be directly serialized to JSON.
      // Usually you upload them separately and store only URLs.
      "images": images.map((file) => file.path).toList(), // or handle via multipart upload
      "owner": owner,
      "isActive": isActive,
      "rating": rating.toJson(),
      "createdAt": createdAt,
      "updatedAt": updatedAt,
    };
  }
}

// ---------------------------------------------------------
// All other classes remain 100% unchanged
// ---------------------------------------------------------

class PricePerHour {
  final String date;
  final String startTime;
  final String endTime;
  final int pricePerHour;
  final String id;

  PricePerHour({
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.pricePerHour,
    required this.id,
  });

  factory PricePerHour.fromJson(Map<String, dynamic> json) {
    return PricePerHour(
      date: json['date'] ?? '',
      startTime: json['startTime'] ?? '',
      endTime: json['endTime'] ?? '',
      pricePerHour: json['pricePerHour'] ?? 0,
      id: json['_id'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "date": date,
      "startTime": startTime,
      "endTime": endTime,
      "pricePerHour": pricePerHour,
      "_id": id,
    };
  }
}

class Location {
  final String address;
  final Coordinates coordinates;
  final String? mapUrl;

  Location({
    required this.address,
    required this.coordinates,
    this.mapUrl,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      address: json['address'] ?? '',
      coordinates: Coordinates.fromJson(json['coordinates']),
      mapUrl: json['mapUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "address": address,
      "coordinates": coordinates.toJson(),
      "mapUrl": mapUrl,
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
      latitude: (json['latitude'] ?? 0).toDouble(),
      longitude: (json['longitude'] ?? 0).toDouble(),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "latitude": latitude,
      "longitude": longitude,
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
      showers: json['showers'] ?? false,
      lights: json['lights'] ?? false,
      parking: json['parking'] ?? false,
      changingRooms: json['changingRooms'] ?? false,
      cafe: json['cafe'] ?? false,
      equipmentRental: json['equipmentRental'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "showers": showers,
      "lights": lights,
      "parking": parking,
      "changingRooms": changingRooms,
      "cafe": cafe,
      "equipmentRental": equipmentRental,
    };
  }
}

// ImageData class removed completely – now using List<File> directly in CreateFieldResponseModel

class Rating {
  final double average;
  final int count;

  Rating({required this.average, required this.count});

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      average: (json['average'] ?? 0).toDouble(),
      count: json['count'] ?? 0,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "average": average,
      "count": count,
    };
  }
}