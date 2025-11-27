import 'dart:convert';

class CreateTeamRequest {
  final String name;
  final String description;

  CreateTeamRequest({
    required this.name,
    required this.description,
  });

  // Convert Dart object to JSON
  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
      };

  // Convert JSON string to Dart object (optional, for testing)
  factory CreateTeamRequest.fromJson(Map<String, dynamic> json) =>
      CreateTeamRequest(
        name: json["name"],
        description: json["description"],
      );

  // Encode to JSON string
  String toJsonString() => json.encode(toJson());

  // Decode from JSON string
  factory CreateTeamRequest.fromJsonString(String str) =>
      CreateTeamRequest.fromJson(json.decode(str));
}
