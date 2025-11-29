class CreateFieldResponseModel {
  final String fieldName;
  final String description;
  final String fieldType;
  final bool promotion;
  final int basePricePerHour;
  final List<PricePerHour> pricePerHour;
  final Location location;
  final ServicesAmenities servicesAmenities;
  final List<FieldImage> images;
  final String owner;
  final bool isActive;
  final Rating rating;
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;

  CreateFieldResponseModel({
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
    required this.id,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CreateFieldResponseModel.fromJson(Map<String, dynamic> json) {
    return CreateFieldResponseModel(
      fieldName: json['fieldName'],
      description: json['description'],
      fieldType: json['fieldType'],
      promotion: json['promotion'],
      basePricePerHour: json['basePricePerHour'],
      pricePerHour: (json['pricePerHour'] as List)
          .map((e) => PricePerHour.fromJson(e))
          .toList(),
      location: Location.fromJson(json['location']),
      servicesAmenities: ServicesAmenities.fromJson(json['servicesAmenities']),
      images: (json['images'] as List)
          .map((e) => FieldImage.fromJson(e))
          .toList(),
      owner: json['owner'],
      isActive: json['isActive'],
      rating: Rating.fromJson(json['rating']),
      id: json['_id'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}

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
      date: json['date'],
      startTime: json['startTime'],
      endTime: json['endTime'],
      pricePerHour: json['pricePerHour'],
      id: json['_id'],
    );
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
      address: json['address'],
      coordinates: Coordinates.fromJson(json['coordinates']),
      mapUrl: json['mapUrl'],
    );
  }
}

class Coordinates {
  final double latitude;
  final double longitude;

  Coordinates({required this.latitude, required this.longitude});

  factory Coordinates.fromJson(Map<String, dynamic> json) {
    return Coordinates(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );
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
}

class Rating {
  final double average;
  final int count;

  Rating({required this.average, required this.count});

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      average: (json['average'] as num).toDouble(),
      count: json['count'],
    );
  }
}
