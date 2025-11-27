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
    // Handle user ID safely
    String userId = "";
    if (json["user"] != null) {
      if (json["user"] is String) {
        userId = json["user"];
      } else if (json["user"] is Map<String, dynamic>) {
        userId = json["user"]["_id"] ?? "";
      }
    }

    return Message(
      text: json["text"] ?? "",
      user: userId,
      date: DateTime.tryParse(json["date"] ?? "") ?? DateTime.now(),
      read: json["read"] ?? false,
      accept: json["accept"] ?? false,
      id: json["_id"] ?? "",
    );
  }
}


// import 'get_single_chat_response_model.dart';

// class Message {
//   final String id;
//   final String text;
//   final User user;
//   final DateTime date;
//   final bool read;
//   final bool accept;

//   Message({
//     required this.id,
//     required this.text,
//     required this.user,
//     required this.date,
//     required this.read,
//     required this.accept,
//   });

//   factory Message.fromJson(Map<String, dynamic> json) => Message(
//         id: json["_id"] ?? "",
//         text: json["text"] ?? "",
//         user: User.fromJson(json["user"]),
//         date: DateTime.parse(json["date"] ?? DateTime.now().toString()),
//         read: json["read"] ?? false,
//         accept: json["accept"] ?? false,
//       );
// }
