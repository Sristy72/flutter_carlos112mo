class SendMessageRequestModel {
  final String chatId;
  final String message;

  SendMessageRequestModel({
    required this.chatId,
    required this.message,
  });

  Map<String, dynamic> toJson() {
    return {
      "chatId": chatId,
      "message": message,
    };
  }

  factory SendMessageRequestModel.fromJson(Map<String, dynamic> json) {
    return SendMessageRequestModel(
      chatId: json["chatId"] ?? "",
      message: json["message"] ?? "",
    );
  }
}
