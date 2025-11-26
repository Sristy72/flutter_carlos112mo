class SingleChatResponseModel {
  String id;
  String name;
  String team;
  String user;
  List<Message> messages;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  SingleChatResponseModel({
    required this.id,
    required this.name,
    required this.team,
    required this.user,
    required this.messages,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory SingleChatResponseModel.fromJson(Map<String, dynamic> json) {
    return SingleChatResponseModel(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      team: json['team'] ?? '',
      user: json['user'] ?? '',
      messages:
          (json['messages'] as List<dynamic>?)
              ?.map((x) => Message.fromJson(x as Map<String, dynamic>))
              .toList() ??
          [],
      createdAt: DateTime.tryParse(json['createdAt'] ?? '') ?? DateTime.now(),
      updatedAt: DateTime.tryParse(json['updatedAt'] ?? '') ?? DateTime.now(),
      v: json['__v'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'team': team,
      'user': user,
      // 'messages': messages.map((x) => x.toJson()).toList(),
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      '__v': v,
    };
  }
}

class Message {
  String text;
  User? user;
  DateTime date;
  bool read;
  bool accept;
  String id;

  Message({
    required this.text,
    this.user,
    required this.date,
    required this.read,
    required this.accept,
    required this.id,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      text: json['text'] ?? '',
      user: json['user'] != null
          ? User.fromJson(json['user'] as Map<String, dynamic>)
          : null,
      date: DateTime.tryParse(json['date'] ?? '') ?? DateTime.now(),
      read: json['read'] ?? false,
      accept: json['accept'] ?? false,
      id: json['_id'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'user': user?.toJson(),
      'date': date.toIso8601String(),
      'read': read,
      'accept': accept,
      '_id': id,
    };
  }
}

class User {
  String id;
  String name;
  String role;
  Avatar? avatar;

  User({required this.id, required this.name, required this.role, this.avatar});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      role: json['role'] ?? '',
      avatar: json['avatar'] != null
          ? Avatar.fromJson(json['avatar'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {'_id': id, 'name': name, 'role': role, 'avatar': avatar?.toJson()};
  }
}

class Avatar {
  String publicId;
  String url;

  Avatar({required this.publicId, required this.url});

  factory Avatar.fromJson(Map<String, dynamic>? json) {
    if (json == null) return Avatar(publicId: '', url: '');
    return Avatar(publicId: json['public_id'] ?? '', url: json['url'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {'public_id': publicId, 'url': url};
  }
}
