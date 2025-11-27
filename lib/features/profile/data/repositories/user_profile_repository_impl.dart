import 'dart:convert';

import 'package:flutter_carlos112mo/core/network/api_client.dart';
import 'package:flutter_carlos112mo/core/network/constants/api_constants.dart';
import 'package:flutter_carlos112mo/core/network/network_result.dart';
import 'package:flutter_carlos112mo/features/profile/data/models/user_profile_response_model.dart';
import 'package:flutter_carlos112mo/features/profile/domain/repositories/user_profile_repository.dart';

import '../models/user_profile_request_model.dart';

class UserProfileRepositoryImpl implements UserProfileRepository {
  final ApiClient _apiClient;

  UserProfileRepositoryImpl({required ApiClient apiClient})
    : _apiClient = apiClient;
  @override
  NetworkResult<UserProfileResponseModel> getUserProfile() {
    return _apiClient.get(
      ApiConstants.user.getUserProfile,
      fromJsonT: (json) => UserProfileResponseModel.fromJson(json),
    );
  }

  @override
  NetworkResult<void> updateUserProfile(
    UserProfileRequestModel userProfileRequestModel,
  ) {
   return _apiClient.patch(ApiConstants.user.updateProfile, data: jsonEncode(userProfileRequestModel.toJson()), fromJsonT: (json) => {});
  }
}
