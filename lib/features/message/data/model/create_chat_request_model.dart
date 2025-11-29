class CreateChatRequestModel {
  final String teamId;

  CreateChatRequestModel({required this.teamId});

  Map<String, dynamic> toJson() {
    return {
      "teamId": teamId,
    };
  }
}
