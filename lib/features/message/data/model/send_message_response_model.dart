class SendMessageResponseModel {
  final String id;
  final String name;
  final String team;
  final String user;
  final List<Message> messages;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  SendMessageResponseModel({
    required this.id,
    required this.name,
    required this.team,
    required this.user,
    required this.messages,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory SendMessageResponseModel.fromJson(Map<String, dynamic> json) {
    return SendMessageResponseModel(
      id: json["_id"] ?? "",
      name: json["name"] ?? "",
      team: json["team"] ?? "",
      user: json["user"] ?? "",
      messages: (json["messages"] as List? ?? [])
          .map((m) => Message.fromJson(m))
          .toList(),
      createdAt: DateTime.parse(json["createdAt"] ?? DateTime.now().toString()),
      updatedAt: DateTime.parse(json["updatedAt"] ?? DateTime.now().toString()),
      v: json["__v"] ?? 0,
    );
  }
}

class Message {
  final String text;
  final String user;
  final DateTime date;
  final bool read;
  final bool accept;
  final String id;

  Message({
    required this.text,
    required this.user,
    required this.date,
    required this.read,
    required this.accept,
    required this.id,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      text: json["text"] ?? "",
      user: json["user"] ?? "",
      date: DateTime.parse(json["date"] ?? DateTime.now().toString()),
      read: json["read"] ?? false,
      accept: json["accept"] ?? false,
      id: json["_id"] ?? "",
    );
  }
}
