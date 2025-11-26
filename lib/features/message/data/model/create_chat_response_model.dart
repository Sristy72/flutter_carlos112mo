class CreateChatResponseModel {
  final String id;
  final String name;
  final String team;
  final String user;
  final List<MessageModel> messages;
  final String createdAt;
  final String updatedAt;
  final int v;

  CreateChatResponseModel({
    required this.id,
    required this.name,
    required this.team,
    required this.user,
    required this.messages,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory CreateChatResponseModel.fromJson(Map<String, dynamic> json) {
    return CreateChatResponseModel(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      team: json['team'] ?? '',
      user: json['user'] ?? '',
      messages: (json['messages'] as List<dynamic>?)
              ?.map((e) => MessageModel.fromJson(e))
              .toList() ??
          [],
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      v: json['__v'] ?? 0,
    );
  }
}

class MessageModel {
  final String text;
  final String user;
  final String date;
  final bool read;
  final bool accept;
  final String id;

  MessageModel({
    required this.text,
    required this.user,
    required this.date,
    required this.read,
    required this.accept,
    required this.id,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      text: json['text'] ?? '',
      user: json['user'] ?? '',
      date: json['date'] ?? '',
      read: json['read'] ?? false,
      accept: json['accept'] ?? false,
      id: json['_id'] ?? '',
    );
  }
}
