import 'package:flutter/material.dart';

class VenueModel {
  final String title;
  final String address;
  final double rating;
  final int reviewCount;
  final String type;
  final String description;
  final double pricePerHour;
  final List<AmenityModel> amenities;
  final List<String> photos;

  VenueModel({
    required this.title,
    required this.address,
    required this.rating,
    required this.reviewCount,
    required this.type,
    required this.description,
    required this.pricePerHour,
    required this.amenities,
    required this.photos,
  });

  // ✅ Ready for API integration
  factory VenueModel.fromJson(Map<String, dynamic> json) => VenueModel(
        title: json["title"],
        address: json["address"],
        rating: (json["rating"] ?? 0).toDouble(),
        reviewCount: json["reviewCount"] ?? 0,
        type: json["type"] ?? "",
        description: json["description"] ?? "",
        pricePerHour: (json["pricePerHour"] ?? 0).toDouble(),
        amenities: (json["amenities"] as List<dynamic>)
            .map((e) => AmenityModel.fromJson(e))
            .toList(),
        photos: List<String>.from(json["photos"] ?? []),
      );
}

class AmenityModel {
  final String name;
  final IconData icon;

  AmenityModel(this.name, this.icon);

  factory AmenityModel.fromJson(Map<String, dynamic> json) {
    // map API icons later
    return AmenityModel(json["name"], Icons.check);
  }
}
