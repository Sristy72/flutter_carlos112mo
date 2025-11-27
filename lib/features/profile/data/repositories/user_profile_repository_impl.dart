import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_carlos112mo/core/network/api_client.dart';
import 'package:flutter_carlos112mo/core/network/constants/api_constants.dart';
import 'package:flutter_carlos112mo/core/network/network_result.dart';
import 'package:flutter_carlos112mo/features/profile/data/models/change_password_request_model.dart';
import 'package:flutter_carlos112mo/features/profile/data/models/user_profile_response_model.dart';
import 'package:flutter_carlos112mo/features/profile/domain/repositories/user_profile_repository.dart';

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
    String? imagePath,
    String name,
    String phone,
    String position,
    String age,
    String favoriteClub,
    String address,
  ) {
    final formData = FormData.fromMap({
      'name': name,
      'phone': phone,
      'position': position,
      if (age.isNotEmpty) 'age': int.tryParse(age) ?? 0,
      'favorite_club': favoriteClub,
      'address': address,
      if (imagePath != null && imagePath.isNotEmpty)
        'avatar': MultipartFile.fromFileSync(imagePath),
    });
    return _apiClient.patch(
      ApiConstants.user.updateProfile,
      data: formData,
      isFormData: true,
      fromJsonT: (json) => {},
    );
  }

  @override
  NetworkResult<void> changePassword(ChangePasswordRequestModel requestModel) {
    return _apiClient.post(
      ApiConstants.auth.changePassword,
      data: requestModel.toJson(),
      fromJsonT: (json) => {},
    );
  }
}
