import 'package:flutter_carlos112mo/core/network/network_result.dart';
import 'package:flutter_carlos112mo/features/profile/data/models/change_password_request_model.dart';
import 'package:flutter_carlos112mo/features/profile/data/models/user_profile_response_model.dart';

abstract class UserProfileRepository {
  NetworkResult<UserProfileResponseModel> getUserProfile();
  NetworkResult<void> updateUserProfile(
    String? imagePath,
    String name,
    String phone,
    String position,
    String age,
    String favoriteClub,
    String address,
  );
  NetworkResult<void> changePassword(ChangePasswordRequestModel requestModel);
}
