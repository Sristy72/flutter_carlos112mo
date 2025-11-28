import 'dart:io';

import 'package:get/get.dart';

import '../../../Owner/data/domain/field_repository.dart';
import '../../../Owner/data/model/change_password_request.dart';
import 'package:dio/dio.dart';
import 'dart:io';


// NOTE: this matches your screen usage: userProfileModel?.name, .avatar.url
class UserProfileModel {
  final String? name;
  final Avatar? avatar;

  UserProfileModel({this.name, this.avatar});
}

class Avatar {
  final String? url;
  Avatar({this.url});
}

class UserProfileController extends GetxController {
  final FieldRepo _fieldRepo;

  UserProfileController(this._fieldRepo);

  // what your UI reads
  UserProfileModel? userProfileModel;



  // 🔹 used by your Obx button
  final isChangingPassword = false.obs;

  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    isChangingPassword.value = true;

    final request = ChangePasswordRequest(
      oldPassword: currentPassword,
      newPassword: newPassword,
    );

    final result = await _fieldRepo.changePass(request);

    result.fold(
          (failure) {
        Get.snackbar(
          'Error',
          failure.message ?? 'Something went wrong',
          snackPosition: SnackPosition.BOTTOM,
        );
      },
          (success) {
        Get.snackbar(
          'Success',
          success.message ?? 'Password changed successfully',
          snackPosition: SnackPosition.BOTTOM,
        );
      },
    );

    isChangingPassword.value = false;
  }


  //update profile---------------------------------------------







}
