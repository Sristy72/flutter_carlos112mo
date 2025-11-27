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
      fields: (json['fields'] as List<dynamic>? ?? [])
          .map((e) => Field.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: json['totalPages'] as int? ?? 0,
      currentPage: json['currentPage'] as int? ?? 0,
      totalFields: json['totalFields'] as int? ?? 0,
    );
  }
}

class Field {
  final String id;
  final String? fieldName;
  final String? description;
  final String? fieldType;
  final double? pricePerHour; // old single price (kept for backward compat)
  final double? basePricePerHour; // new
  final bool? promotion; // new
  final Location? location;
  final ServicesAmenities? servicesAmenities;
  final Rating? rating;
  final List<ImageItem>? images;
  final Owner? owner;
  final bool? isActive;
  final String? createdAt;
  final String? updatedAt;
  final List<PricePerHourSlot>? pricePerHourSlots; // new dynamic pricing list

  Field({
    required this.id,
    this.fieldName,
    this.description,
    this.fieldType,
    this.pricePerHour,
    this.basePricePerHour,
    this.promotion,
    this.location,
    this.servicesAmenities,
    this.rating,
    this.images,
    this.owner,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.pricePerHourSlots,
  });

  factory Field.fromJson(Map<String, dynamic> json) {
    return Field(
      id: json['_id'] as String? ?? '',
      fieldName: json['fieldName'] as String?,
      description: json['description'] as String?,
      fieldType: json['fieldType'] as String?,
      pricePerHour: json['pricePerHour'] is num
          ? (json['pricePerHour'] as num).toDouble()
          : null,
      basePricePerHour: json['basePricePerHour'] is num
          ? (json['basePricePerHour'] as num).toDouble()
          : null,
      promotion: json['promotion'] as bool?,
      location: json['location'] != null
          ? Location.fromJson(json['location'] as Map<String, dynamic>)
          : null,
      servicesAmenities: json['servicesAmenities'] != null
          ? ServicesAmenities.fromJson(
              json['servicesAmenities'] as Map<String, dynamic>,
            )
          : null,
      rating: json['rating'] != null
          ? Rating.fromJson(json['rating'] as Map<String, dynamic>)
          : null,
      images: json['images'] != null
          ? (json['images'] as List<dynamic>?)
                ?.map((e) => ImageItem.fromJson(e as Map<String, dynamic>))
                .toList()
          : null,
      owner: json['owner'] != null
          ? Owner.fromJson(json['owner'] as Map<String, dynamic>)
          : null,
      isActive: json['isActive'] as bool?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      pricePerHourSlots: json['pricePerHour'] is List
          ? (json['pricePerHour'] as List<dynamic>)
                .map(
                  (e) => PricePerHourSlot.fromJson(e as Map<String, dynamic>),
                )
                .toList()
          : null,
    );
  }
}

// New models for the dynamic pricing slots
class PricePerHourSlot {
  final String? date;
  final String? startTime;
  final String? endTime;
  final double? pricePerHour;
  final String? id;

  PricePerHourSlot({
    this.date,
    this.startTime,
    this.endTime,
    this.pricePerHour,
    this.id,
  });

  factory PricePerHourSlot.fromJson(Map<String, dynamic> json) {
    return PricePerHourSlot(
      date: json['date'] as String?,
      startTime: json['startTime'] as String?,
      endTime: json['endTime'] as String?,
      pricePerHour: json['pricePerHour'] is num
          ? (json['pricePerHour'] as num).toDouble()
          : null,
      id: json['_id'] as String?,
    );
  }
}

// ──────────────────────────────────────────────────────────────
// The rest of your classes stay exactly the same (only tiny null‑safety fixes)

class Location {
  final Coordinates? coordinates;
  final String? address;
  final String? mapUrl;

  Location({this.coordinates, this.address, this.mapUrl});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      coordinates: json['coordinates'] != null
          ? Coordinates.fromJson(json['coordinates'] as Map<String, dynamic>)
          : null,
      address: json['address'] as String?,
      mapUrl: json['mapUrl'] as String?,
    );
  }
}

class Coordinates {
  final double? latitude;
  final double? longitude;

  Coordinates({this.latitude, this.longitude});

  factory Coordinates.fromJson(Map<String, dynamic> json) {
    return Coordinates(
      latitude: json['latitude'] is num
          ? (json['latitude'] as num).toDouble()
          : null,
      longitude: json['longitude'] is num
          ? (json['longitude'] as num).toDouble()
          : null,
    );
  }
}

class ServicesAmenities {
  final bool? showers;
  final bool? lights;
  final bool? parking;
  final bool? changingRooms;
  final bool? cafe;
  final bool? equipmentRental;

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
      showers: json['showers'] as bool?,
      lights: json['lights'] as bool?,
      parking: json['parking'] as bool?,
      changingRooms: json['changingRooms'] as bool?,
      cafe: json['cafe'] as bool?,
      equipmentRental: json['equipmentRental'] as bool?,
    );
  }
}

class Rating {
  final double? average;
  final int? count;

  Rating({this.average, this.count});

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      average: json['average'] is num
          ? (json['average'] as num).toDouble()
          : null,
      count: json['count'] as int?,
    );
  }
}

class ImageItem {
  final String? url;
  final String? originalName;
  final String? uploadDate;
  final String? id;

  ImageItem({this.url, this.originalName, this.uploadDate, this.id});

  factory ImageItem.fromJson(Map<String, dynamic> json) {
    return ImageItem(
      url: json['url'] as String?,
      originalName: json['originalName'] as String?,
      uploadDate: json['uploadDate'] as String?,
      id: json['_id'] as String?,
    );
  }
}

class Owner {
  final String? id;
  final String? name;
  final String? email;

  Owner({this.id, this.name, this.email});

  factory Owner.fromJson(Map<String, dynamic> json) {
    return Owner(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
    );
  }
}
