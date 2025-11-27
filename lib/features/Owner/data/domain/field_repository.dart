import 'package:dio/dio.dart';
import 'package:flutter_carlos112mo/features/Owner/data/models/response_model/create_field_response_model.dart';

import '../../../../core/network/network_result.dart';



abstract class FieldRepo {
  // NetworkResult<FetchProfileResponseModel> fetchProfile();

  //profile update
  NetworkResult<CreateFieldResponseModel> createNewField(FormData request);

// //Change password
//   NetworkResult<void> changePass(ChangePasswordRequest request);
//
//   NetworkResult<UserResponse> uploadPhoto(FormData request);
//
//
//   NetworkResult<UserResponse> tradingInfo(FormData request);
}
