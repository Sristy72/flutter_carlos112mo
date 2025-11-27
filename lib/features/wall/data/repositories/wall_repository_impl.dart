import 'package:flutter_carlos112mo/core/network/api_client.dart';
import 'package:flutter_carlos112mo/core/network/constants/api_constants.dart';
import 'package:flutter_carlos112mo/core/network/network_result.dart';
import 'package:flutter_carlos112mo/features/wall/data/models/comment_request_model.dart';
import 'package:flutter_carlos112mo/features/wall/data/models/wall_post_model.dart';
import 'package:flutter_carlos112mo/features/wall/domain/repositories/wall_repository.dart';

class WallRepositoryImpl implements WallRepository{
  final ApiClient _apiClient;

  WallRepositoryImpl({required ApiClient apiClient}) : _apiClient = apiClient;
  @override
  NetworkResult<List<WallPostModel>> getWallPosts() {
    return _apiClient.get(ApiConstants.wall.getAllPost, fromJsonT: (json) => (json as List).map((item) => WallPostModel.fromJson(item)).toList()

        );
  }

  @override
  NetworkResult<void> postComment(CommentRequestModel requestModel, String postId) {
    return _apiClient.post(ApiConstants.wall.postComment(postId), data: requestModel.toJson(), fromJsonT: (json) => {});
  }

  @override
  NetworkResult<void> joinMatch(String teamId) {
    return _apiClient.get(ApiConstants.team.joinMatch(teamId), fromJsonT: (json) => {});
  }
}