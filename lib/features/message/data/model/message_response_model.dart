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


// class Message {
//   final String text;
//   final String userId;        // renamed from 'user' to be clearer
//   final DateTime date;
//   final bool read;
//   final bool accept;
//   final String id;
//   final bool isMe;            // true if this message is sent by current user

//   Message({
//     required this.text,
//     required this.userId,
//     required this.date,
//     required this.read,
//     required this.accept,
//     required this.id,
//     required this.isMe,
//   });

//   factory Message.fromJson(Map<String, dynamic> json, {required String currentUserId}) {
//     // Safely extract userId whether it's a String or an object { "_id": "..." }
//     dynamic userField = json["user"];
//     String userId = "";

//     if (userField is String) {
//       userId = userField;
//     } else if (userField is Map<String, dynamic>) {
//       userId = userField["_id"]?.toString() ?? "";
//     }

//     final String messageId = json["_id"]?.toString() ?? "";
//     final String messageText = json["text"]?.toString() ?? "";
//     final DateTime messageDate = DateTime.tryParse(json["date"]?.toString() ?? "") ?? DateTime.now();

//     return Message(
//       text: messageText,
//       userId: userId,
//       date: messageDate,
//       read: json["read"] as bool? ?? false,
//       accept: json["accept"] as bool? ?? false,
//       id: messageId,
//       isMe: userId == currentUserId, // This is the key!
//     );
//   }

//   // Optional: Helper to create a list of messages
//   static List<Message> fromJsonList(List<dynamic> jsonList, {required String currentUserId}) {
//     return jsonList
//         .map((json) => Message.fromJson(json as Map<String, dynamic>, currentUserId: currentUserId))
//         .toList();
//   }
// }