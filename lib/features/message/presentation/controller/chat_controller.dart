import 'package:get/get.dart';

class ChatController extends GetxController {
  var messages = <ChatMessage>[].obs;
  var messageText = ''.obs;

  void sendMessage(String text) {
    if (text.trim().isEmpty) return;

    messages.add(
      ChatMessage(
        senderName: "You",
        senderImage: "",
        message: text,
        isMe: true,
        time: DateTime.now(),
      ),
    );

    messageText.value = "";
  }

  // For future API integration
  void loadMessages() {
    // TODO: API Call
  }
}

class ChatMessage {
  final String senderName;
  final String senderImage;
  final String message;
  final bool isMe;
  final DateTime time;

  ChatMessage({
    required this.senderName,
    required this.senderImage,
    required this.message,
    required this.isMe,
    required this.time,
  });
}
