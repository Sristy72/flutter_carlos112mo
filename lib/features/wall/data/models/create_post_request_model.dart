class CreatePostRequestModel {
  String? content;
  String? teamId;

  CreatePostRequestModel({this.content, this.teamId});

  CreatePostRequestModel.fromJson(Map<String, dynamic> json) {
    content = json['content'];
    teamId = json['teamId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['content'] = content;
    if (teamId != null && teamId!.isNotEmpty) {
      data['teamId'] = teamId;
    }
    return data;
  }
}
