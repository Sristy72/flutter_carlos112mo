import 'message_response_model.dart';

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
  final msgs = json['messages'];
  List<Message> messageList = [];
  if (msgs != null && msgs is List) {
    messageList = msgs.map((x) {
      if (x != null && x is Map<String, dynamic>) {
        return Message.fromJson(x);
      } else {
        return Message(
          text: "",
          user: "",
          date: DateTime.now(),
          read: false,
          accept: false,
          id: "",
        );
      }
    }).toList();
  }

  return SingleChatResponseModel(
    id: json['_id'] ?? '',
    name: json['name'] ?? '',
    team: json['team'] ?? '',
    user: json['user'] ?? '',
    messages: messageList,
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
