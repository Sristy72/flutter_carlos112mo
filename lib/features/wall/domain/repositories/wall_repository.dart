import 'package:flutter_carlos112mo/core/network/network_result.dart';
import 'package:flutter_carlos112mo/features/wall/data/models/comment_request_model.dart';
import 'package:flutter_carlos112mo/features/wall/data/models/wall_post_model.dart';

abstract class WallRepository{
  NetworkResult<List<WallPostModel>> getWallPosts();
  NetworkResult<void> postComment(CommentRequestModel requestModel, String postId);
  NetworkResult<void> joinMatch(String teamId);
}