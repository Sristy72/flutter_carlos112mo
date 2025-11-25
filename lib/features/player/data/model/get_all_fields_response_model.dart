class GetAllFieldsResponseModel {
  final List<Field> fields;
  final int totalPages;
  final int currentPage;
  final int totalFields;

  GetAllFieldsResponseModel({
    required this.fields,
    required this.totalPages,
    required this.currentPage,
    required this.totalFields,
  });

  factory GetAllFieldsResponseModel.fromJson(Map<String, dynamic> json) {
    return GetAllFieldsResponseModel(
      fields: (json['fields'] as List).map((e) => Field.fromJson(e)).toList(),
      totalPages: json['totalPages'],
      currentPage: json['currentPage'],
      totalFields: json['totalFields'],
    );
  }
}

class Field {
  final String id;
  final String fieldName;
  final String description;
  final String fieldType;
  final double pricePerHour;
  final Location location;
  final ServicesAmenities servicesAmenities;
  final Rating rating;
  final List<ImageItem> images;
  final Owner owner;
  final bool isActive;
  final String createdAt;
  final String updatedAt;

  Field({
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
  });

  factory Field.fromJson(Map<String, dynamic> json) {
    return Field(
      id: json['_id'],
      fieldName: json['fieldName'],
      description: json['description'],
      fieldType: json['fieldType'],
      pricePerHour: (json['pricePerHour'] as num).toDouble(),
      location: Location.fromJson(json['location']),
      servicesAmenities: ServicesAmenities.fromJson(json['servicesAmenities']),
      rating: Rating.fromJson(json['rating']),
      images: (json['images'] as List)
          .map((e) => ImageItem.fromJson(e))
          .toList(),
      owner: Owner.fromJson(json['owner']),
      isActive: json['isActive'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}

class Location {
  final Coordinates coordinates;
  final String address;
  final String? mapUrl;

  Location({required this.coordinates, required this.address, this.mapUrl});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      coordinates: Coordinates.fromJson(json['coordinates']),
      address: json['address'],
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

class ImageItem {
  final String url;
  final String originalName;
  final String uploadDate;
  final String id;

  ImageItem({
    required this.url,
    required this.originalName,
    required this.uploadDate,
    required this.id,
  });

  factory ImageItem.fromJson(Map<String, dynamic> json) {
    return ImageItem(
      url: json['url'],
      originalName: json['originalName'],
      uploadDate: json['uploadDate'],
      id: json['_id'],
    );
  }
}

class Owner {
  final String id;
  final String name;
  final String email;

  Owner({required this.id, required this.name, required this.email});

  factory Owner.fromJson(Map<String, dynamic> json) {
    return Owner(id: json['_id'], name: json['name'], email: json['email']);
  }
}
