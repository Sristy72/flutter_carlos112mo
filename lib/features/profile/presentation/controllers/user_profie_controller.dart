import 'package:flutter/cupertino.dart';
import 'package:flutter_carlos112mo/core/base/base_controller.dart';
import 'package:flutter_carlos112mo/features/profile/data/models/user_profile_request_model.dart';
import 'package:flutter_carlos112mo/features/profile/data/models/user_profile_response_model.dart';
import 'package:flutter_carlos112mo/features/profile/domain/repositories/user_profile_repository.dart';
import 'package:get/get.dart';

class UserProfileController extends BaseController {
  final UserProfileRepository _userProfileRepository;
  final Rx<UserProfileResponseModel?> _userProfileModel =
      Rx<UserProfileResponseModel?>(null);
  UserProfileResponseModel? get userProfileModel => _userProfileModel.value;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late final TextEditingController nameController;
  late final TextEditingController phoneNumberController;
  late final TextEditingController ageController;
  late final TextEditingController favoriteClubsController;
  late final TextEditingController locationController;
  RxString position = ''.obs;
  RxBool isFieldEditable = false.obs;

  @override
  void onInit() {
    super.onInit();
    getUserProfile();
  }

  void initializeControllers() {
    nameController = TextEditingController(text: userProfileModel?.name);
    phoneNumberController = TextEditingController(
      text: userProfileModel?.phone,
    );
    ageController = TextEditingController(
      text: userProfileModel?.age.toString(),
    );
    favoriteClubsController = TextEditingController(
      text: userProfileModel?.favoriteClub,
    );
    locationController = TextEditingController(
      text: userProfileModel?.location?.coordinates.toString(),
    );
  }

  void changePosition(String newPosition) {
    position.value = newPosition;
  }

  UserProfileController(this._userProfileRepository);

  Future<void> getUserProfile() async {
    setError('');
    setLoading(true);
    final result = await _userProfileRepository.getUserProfile();
    result.fold(
      (failure) {
        setError(failure.message);
        setLoading(false);
        Get.snackbar(
          'Error',
          'Failed to fetch user profile: ${failure.message}',
          snackPosition: SnackPosition.BOTTOM,
        );
      },
      (success) {
        _userProfileModel.value = success.data;
        initializeControllers();
        position.value = success.data.position ?? '';
        setLoading(false);
        Get.snackbar(
          'Success',
          'User profile fetched successfully',
          snackPosition: SnackPosition.BOTTOM,
        );
      },
    );
  }

  Future<void> updateUserProfile() async {
    setError('');
    setLoading(true);

    final request = UserProfileRequestModel(
      name: nameController.text,
      phone: phoneNumberController.text,
      age: int.tryParse(ageController.text),
      favoriteClub: favoriteClubsController.text,
      position: position.value,
      address: null,
    );

    final result = await _userProfileRepository.updateUserProfile(request);
    result.fold((failure) {
      setError(failure.message);
      setLoading(false);
      Get.snackbar(
        'Error',
        'Failed to update user profile: ${failure.message}',
        snackPosition: SnackPosition.BOTTOM,
      );
    }, (success) {
      getUserProfile();
      setLoading(false);
      Get.snackbar(
        'Success',
        'User profile updated successfully',
        snackPosition: SnackPosition.BOTTOM,);
    });
  }
}
