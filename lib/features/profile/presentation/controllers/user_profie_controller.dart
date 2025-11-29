import 'package:flutter/cupertino.dart';
import 'package:flutter_carlos112mo/core/base/base_controller.dart';
import 'package:flutter_carlos112mo/features/profile/data/models/change_password_request_model.dart';
import 'package:flutter_carlos112mo/features/profile/data/models/user_profile_response_model.dart';
import 'package:flutter_carlos112mo/features/profile/domain/repositories/user_profile_repository.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserProfileController extends BaseController {
  final UserProfileRepository _userProfileRepository;
  final Rx<UserProfileResponseModel?> _userProfileModel =
      Rx<UserProfileResponseModel?>(null);
  UserProfileResponseModel? get userProfileModel => _userProfileModel.value;
  final GlobalKey<FormState> profileFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> passwordFormKey = GlobalKey<FormState>();
  late final TextEditingController nameController;
  late final TextEditingController phoneNumberController;
  late final TextEditingController ageController;
  late final TextEditingController favoriteClubsController;
  late final TextEditingController locationController;
  late final TextEditingController oldPasswordController;
  late final TextEditingController newPasswordController;
  late final TextEditingController confirmPasswordController;
  RxString position = ''.obs;
  RxBool isFieldEditable = false.obs;
  final Rx<XFile?> _selectedImage = Rx<XFile?>(null);
  final ImagePicker _picker = ImagePicker();

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
    oldPasswordController = TextEditingController();
    newPasswordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  void changePosition(String newPosition) {
    position.value = newPosition;
  }

  Future<void> pickImage() async {
    final image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      _selectedImage.value = image;
    }
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

    final result = await _userProfileRepository.updateUserProfile(
      _selectedImage.value?.path,
      nameController.text.trim(),
      phoneNumberController.text.trim(),
      position.value,
      ageController.text.trim(),
      favoriteClubsController.text.trim(),
      locationController.text.trim(),
    );
    result.fold(
      (failure) {
        setError(failure.message);
        setLoading(false);
        Get.snackbar(
          'Error',
          'Failed to update user profile: ${failure.message}',
          snackPosition: SnackPosition.BOTTOM,
        );
      },
      (success) {
        getUserProfile();
        setLoading(false);
        Get.snackbar(
          'Success',
          'User profile updated successfully',
          snackPosition: SnackPosition.BOTTOM,
        );
      },
    );
  }

  Future<void> changePassword() async {
    setError('');
    setLoading(true);
    final requestModel = ChangePasswordRequestModel(
      oldPassword: oldPasswordController.text,
      newPassword: confirmPasswordController.text,
    );
    final result = await _userProfileRepository.changePassword(requestModel);
    result.fold((failure){
      setError(failure.message);
      setLoading(false);
      Get.snackbar(
        'Error',
        'Failed to change password: ${failure.message}',
        snackPosition: SnackPosition.BOTTOM,
      );
    }, (success){
      setLoading(false);
      Get.snackbar(
        'Success',
        'Password changed successfully',
        snackPosition: SnackPosition.BOTTOM,
      );

    });
  }
}
