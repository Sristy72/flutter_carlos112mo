import 'package:flutter_carlos112mo/features/others/presentation/screens/dashboard_screen.dart';
import 'package:get/get.dart';

import '../../../../core/base/base_controller.dart';
import '../../../../core/network/services/auth_storage_service.dart';
import '../../../../core/network/services/secure_store_services.dart';
import '../../../../core/services/get_user_profile_service.dart';
import '../../../../core/utils/debug_print.dart';
import '../../data/model/auth_request_model.dart';
import '../../domain/auth_repo.dart';

class AuthController extends BaseController {
  final AuthRepository _authRepository;
  final AuthStorageService _authStorageService;
  bool _isSuccess = false;

  var isLoading = false.obs;
  var errorMessage = "".obs;

  void setLoading(bool value) => isLoading.value = value;
  void setError(String message) => errorMessage.value = message;

  AuthController(this._authRepository, this._authStorageService);

  // final userProfileService = Get.find<GetUserProfileService>();

  // Login
  Future<void> login(String email, String password) async {
    setLoading(true);
    setError("");

    final request = AuthRequestModel(email: email, password: password);

    final result = await _authRepository.login(request);

    DPrint.log("Login Response ${result.isRight()}");

    // _multiFormDataManager.addTextData("name", email);
    // _multiFormDataManager.toFormData();
    //
    // _multiFormDataManager.clear();

    result.fold(
      (fail) {
        setError(fail.message);
        setLoading(false);
      },
      (success) async {
        final user = success.data.user;
        await _authStorageService.storeAuthData(
          accessToken: success.data.accessToken!,
          refreshToken: success.data.refreshToken!,
          userId: success.data.user!.id!,
        );
        Get.to(() => DashboardScreen());
        setLoading(false);
      },
    );
  }
}
