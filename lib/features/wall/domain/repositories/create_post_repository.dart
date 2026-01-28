import 'package:flutter_carlos112mo/core/network/network_result.dart';
import 'package:flutter_carlos112mo/features/wall/data/models/create_post_request_model.dart';

abstract class CreatePostRepository{
  NetworkResult<void> createPost(CreatePostRequestModel requestModel);
}