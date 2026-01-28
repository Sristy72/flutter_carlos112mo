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

  Map<String, dynamic> toJson() => {
    "coordinates": coordinates?.toJson(),
    "address": address,
    "mapUrl": mapUrl,
  };
}
class Coordinates {
  final double? latitude;
  final double? longitude;

  Coordinates({this.latitude, this.longitude});

  factory Coordinates.fromJson(Map<String, dynamic> json) {
    return Coordinates(
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
    "latitude": latitude,
    "longitude": longitude,
  };
}

