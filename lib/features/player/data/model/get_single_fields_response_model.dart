class SingleFieldsResponseModel {
  Location? location;
  ServicesAmenities? servicesAmenities;
  Rating? rating;
  String? id;
  String? fieldName;
  String? description;
  String? fieldType;
  bool? promotion;
  num? basePricePerHour;
  List<PricePerHour>? pricePerHour;
  List<FieldImage>? images;
  Owner? owner;
  bool? isActive;
  String? createdAt;

  SingleFieldsResponseModel({
    this.location,
    this.servicesAmenities,
    this.rating,
    this.id,
    this.fieldName,
    this.description,
    this.fieldType,
    this.promotion,
    this.basePricePerHour,
    this.pricePerHour,
    this.images,
    this.owner,
    this.isActive,
    this.createdAt,
  });

  factory SingleFieldsResponseModel.fromJson(Map<String, dynamic> json) {
    return SingleFieldsResponseModel(
      location: Location.fromJson(json['location']),
      servicesAmenities: ServicesAmenities.fromJson(json['servicesAmenities']),
      rating: Rating.fromJson(json['rating']),
      id: json['_id'],
      fieldName: json['fieldName'],
      description: json['description'],
      fieldType: json['fieldType'],
      promotion: json['promotion'],
      basePricePerHour: json['basePricePerHour'],
      pricePerHour: List.from(
        json['pricePerHour'].map((e) => PricePerHour.fromJson(e)),
      ),
      images: List.from(json['images'].map((e) => FieldImage.fromJson(e))),
      owner: Owner.fromJson(json['owner']),
      isActive: json['isActive'],
      createdAt: json['createdAt'],
    );
  }
}

// ---------------------- Location ----------------------
class Location {
  Coordinates? coordinates;
  String? address;
  String? mapUrl;

  Location({this.coordinates, this.address, this.mapUrl});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      coordinates: Coordinates.fromJson(json['coordinates']),
      address: json['address'],
      mapUrl: json['mapUrl'],
    );
  }
}

class Coordinates {
  double? latitude;
  double? longitude;

  Coordinates({this.latitude, this.longitude});

  factory Coordinates.fromJson(Map<String, dynamic> json) {
    return Coordinates(
      latitude: json['latitude']?.toDouble(),
      longitude: json['longitude']?.toDouble(),
    );
  }
}

// ------------------ Amenities ------------------
class ServicesAmenities {
  bool? showers, lights, parking, changingRooms, cafe, equipmentRental;

  ServicesAmenities({
    this.showers,
    this.lights,
    this.parking,
    this.changingRooms,
    this.cafe,
    this.equipmentRental,
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

// ------------------ Rating ------------------
class Rating {
  num? average, count;

  Rating({this.average, this.count});

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(average: json['average'], count: json['count']);
  }
}

// ------------------ PricePerHour ------------------
class PricePerHour {
  String? date, startTime, endTime, id;
  num? pricePerHour;

  PricePerHour({
    this.date,
    this.startTime,
    this.endTime,
    this.pricePerHour,
    this.id,
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

// ------------------ Images ------------------
class FieldImage {
  String? url, originalName, uploadDate, id;

  FieldImage({this.url, this.originalName, this.uploadDate, this.id});

  factory FieldImage.fromJson(Map<String, dynamic> json) {
    return FieldImage(
      url: json['url'],
      originalName: json['originalName'],
      uploadDate: json['uploadDate'],
      id: json['_id'],
    );
  }
}

// ------------------ Owner ------------------
class Owner {
  String? id, name, email, phone;

  Owner({this.id, this.name, this.email, this.phone});

  factory Owner.fromJson(Map<String, dynamic> json) {
    return Owner(
      id: json['_id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
    );
  }
}
