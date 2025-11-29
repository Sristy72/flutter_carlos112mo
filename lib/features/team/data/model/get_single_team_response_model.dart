import 'dart:convert';

SingleTeamResponse teamResponseFromJson(String str) =>
    SingleTeamResponse.fromJson(json.decode(str));

String teamResponseToJson(SingleTeamResponse data) =>
    json.encode(data.toJson());

class SingleTeamResponse {
  final String id;
  final String name;
  final String description;
  final List<Member> members;
  final String createdBy;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  SingleTeamResponse({
    required this.id,
    required this.name,
    required this.description,
    required this.members,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory SingleTeamResponse.fromJson(Map<String, dynamic> json) => SingleTeamResponse(
        id: json["_id"],
        name: json["name"],
        description: json["description"],
        members:
            List<Member>.from(json["members"].map((x) => Member.fromJson(x))),
        createdBy: json["createdBy"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "description": description,
        "members": List<dynamic>.from(members.map((x) => x.toJson())),
        "createdBy": createdBy,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}

class Member {
  final String id;
  final String name;
  final String email;

  Member({
    required this.id,
    required this.name,
    required this.email,
  });

  factory Member.fromJson(Map<String, dynamic> json) => Member(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
      };
}
