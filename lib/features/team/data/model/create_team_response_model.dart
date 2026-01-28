import 'dart:convert';

CreateTeamResponse createTeamResponseFromJson(String str) =>
    CreateTeamResponse.fromJson(json.decode(str));

String createTeamResponseToJson(CreateTeamResponse data) =>
    json.encode(data.toJson());

class CreateTeamResponse {
  final String id;
  final String name;
  final String description;
  final List<String> members;
  final String createdBy;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  CreateTeamResponse({
    required this.id,
    required this.name,
    required this.description,
    required this.members,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory CreateTeamResponse.fromJson(Map<String, dynamic> json) =>
      CreateTeamResponse(
        id: json["_id"],
        name: json["name"],
        description: json["description"],
        members: List<String>.from(json["members"].map((x) => x)),
        createdBy: json["createdBy"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "description": description,
        "members": members,
        "createdBy": createdBy,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
