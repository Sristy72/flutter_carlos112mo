import 'package:flutter_carlos112mo/core/network/api_client.dart';
import 'package:flutter_carlos112mo/core/network/constants/api_constants.dart';
import 'package:flutter_carlos112mo/core/network/network_result.dart';
import 'package:flutter_carlos112mo/features/wall/data/models/create_post_request_model.dart';
import 'package:flutter_carlos112mo/features/wall/domain/repositories/create_post_repository.dart';

class CreatePostRepositoryImpl implements CreatePostRepository {
  final ApiClient _apiClient;

  CreatePostRepositoryImpl({required ApiClient apiClient})
    : _apiClient = apiClient;
  @override
  NetworkResult<void> createPost(CreatePostRequestModel requestModel) {
    return _apiClient.post(
      ApiConstants.wall.createPost,
      isFormData: false,
      data: requestModel.toJson(),
      fromJsonT: (json) => {},
    );
  }
}
