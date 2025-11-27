import 'package:dio/dio.dart';
import 'package:flutter_carlos112mo/features/Owner/data/domain/field_repository.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/network/constants/api_constants.dart';
import '../../../../core/network/network_result.dart';
import '../models/response_model/create_field_response_model.dart';


class FieldRepositoryImplementation implements FieldRepo {
  final ApiClient _apiClient;

  FieldRepositoryImplementation({required ApiClient apiClient})
      : _apiClient = apiClient;

  // @override
  // NetworkResult<FetchProfileResponseModel> fetchProfile() {
  //   return _apiClient.get(
  //       ApiConstants.user.getUserProfile,
  //       fromJsonT: (json) =>
  //           FetchProfileResponseModel.fromJson(json as Map<String, dynamic>));
  // }

  @override
  NetworkResult<CreateFieldResponseModel> createNewField(FormData request) {
    return _apiClient.post(
        ApiConstants.owner.createField,
        formData: request,
        fromJsonT: (json) => CreateFieldResponseModel.fromJson(json),
        isFormData: true
    );
  }

  // @override
  // NetworkResult<void> changePass(ChangePasswordRequest request) {
  //   return _apiClient.post(
  //     ApiConstants.auth.changePassword,
  //     data: request.toJson(),
  //     fromJsonT: (json) => [],
  //   );
  // }
  //
  // @override
  // NetworkResult<UserResponse> uploadPhoto(FormData request) {
  //   return _apiClient.patch(
  //       ApiConstants.user.updateProfile,
  //       formData: request,
  //       fromJsonT: (json) => UserResponse.fromJson(json),
  //       isFormData: true
  //   );
  // }
  //
  // @override
  // NetworkResult<UserResponse> tradingInfo(FormData request) {
  //   return _apiClient.patch(
  //       ApiConstants.user.updateProfile,
  //       formData: request,
  //       fromJsonT: (json) => UserResponse.fromJson(json),
  //       isFormData: true
  //   );
  // }
}