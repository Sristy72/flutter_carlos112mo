import 'package:flutter_carlos112mo/core/network/network_result.dart';
import 'package:flutter_carlos112mo/features/profile/data/models/user_profile_request_model.dart';
import 'package:flutter_carlos112mo/features/profile/data/models/user_profile_response_model.dart';

import '../../../Owner/data/model/change_password_request.dart';

abstract class UserProfileRepository {
  NetworkResult<UserProfileResponseModel> getUserProfile();
  NetworkResult<void> updateUserProfile(
    UserProfileRequestModel userProfileRequestModel,
  );

  NetworkResult<dynamic> changePassword(ChangePasswordRequest request);



}
