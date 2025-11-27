class WallPostModel {
  String? sId;
  String? teamId;
  String? userId;
  String? content;
  List<dynamic>? likes;
  List<Comment>? comments;
  String? createdAt;
  String? updatedAt;
  int? iV;

  WallPostModel({
    this.sId,
    this.teamId,
    this.userId,
    this.content,
    this.likes,
    this.comments,
    this.createdAt,
    this.updatedAt,
    this.iV,
  });

  WallPostModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    teamId = json['teamId'];
    userId = json['userId'];
    content = json['content'];

    likes = json['likes'] != null ? List<dynamic>.from(json['likes']) : [];

    if (json['comments'] != null) {
      comments = (json['comments'] as List)
          .map((item) => Comment.fromJson(item))
          .toList();
    } else {
      comments = [];
    }

    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['teamId'] = teamId;
    data['userId'] = userId;
    data['content'] = content;
    data['likes'] = likes ?? [];
    data['comments'] = comments?.map((c) => c.toJson()).toList() ?? [];
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}

class Comment {
  String? userId;
  String? text;
  String? createdAt;
  String? id;

  Comment({
    this.userId,
    this.text,
    this.createdAt,
    this.id,
  });

  Comment.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    text = json['text'];
    createdAt = json['createdAt'];
    id = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['text'] = text;
    data['createdAt'] = createdAt;
    data['_id'] = id;
    return data;
  }
}

