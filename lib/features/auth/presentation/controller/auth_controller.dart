import 'package:flutter_carlos112mo/features/Owner/presentation/screens/owner_home_screen.dart';
import 'package:flutter_carlos112mo/features/auth/presentation/screens/login_screen.dart';
import 'package:flutter_carlos112mo/features/others/presentation/screens/dashboard_screen.dart';
import 'package:get/get.dart';

import '../../../../core/base/base_controller.dart';
import '../../../../core/network/services/auth_storage_service.dart';
import '../../../../core/network/services/secure_store_services.dart';
import '../../../../core/services/get_user_profile_service.dart';
import '../../../../core/utils/debug_print.dart';
import '../../../others/presentation/screens/owner_nav_screen.dart';
import '../../data/model/auth_request_model.dart';
import '../../data/model/forget_password_request_model.dart';
import '../../data/model/refresh_token_request_model.dart';
import '../../data/model/register_request_model.dart';
import '../../data/model/verify_otp_req_model.dart';
import '../../domain/auth_repo.dart';
import '../screens/verify_otp_screen.dart';

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

        // Store tokens + role
        await _authStorageService.storeAuthData(
          accessToken: success.data.accessToken,
          refreshToken: success.data.refreshToken,
          userId: success.data.user.id,
          role: success.data.user.role,
        );

  

        if (user.role == 'user') {
          Get.offAll(() => DashboardScreen());
        } else if (user.role == 'owner') {
          Get.offAll(() => OwnerNavScreen());
        }

        setLoading(false);
      },
    );
  }

  Future<void> register(
    String name,
    String email,
    String password,
    String role,
  ) async {
    setLoading(true);
    setError('');

    final request = RegisterRequestModel(
      name: name,
      email: email,
      password: password,
      role: role,
    );

    final result = await _authRepository.register(request);

    result.fold(
      (fail) {
        setError(fail.message);
        DPrint.log("Register success result : ${fail.message}");
        setLoading(false);
      },
      (success) async {
        DPrint.log("Register success result : ${success.data.name}");
        await _authStorageService.storeAuthData(
          accessToken: success.data.accessToken,
          refreshToken: success.data.refreshToken,
          userId: success.data.id,
          role: success.data.role,
        );
        Get.to(() => LoginScreen());
        setLoading(false);
      },
    );
  }

  Future forgotPassword(String email) async {
    setLoading(true);
    setError('');

    final request = ForgotPassRequestModel.fromJson({'email': email});
    final result = await _authRepository.forgotPassword(request);

    result.fold(
      (fail) {
        setError(fail.message);
        DPrint.log("reset pass success result : ${fail.message}");
        setLoading(false);
      },
      (success) {
        DPrint.log("reset pass success result : ${success.data.message}");
        Get.offAll(() => OtpVerificationScreen(email: email));
        setLoading(false);
      },
    );
  }

  Future verifyOTP(String email, String otp) async {
    setLoading(true);
    setError("");

    final request = VerifyMailOtpRequest(email: email, otp: otp);
    final result = await _authRepository.verifyOtp(request);

    result.fold(
      (fail) {
        setError(fail.message);
        DPrint.log("verify otp success result : ${fail.message}");
        setLoading(false);
      },
      (success) {
        DPrint.log("verify otp success result : ${success.data.message}");
        // Get.to(SetNewPasswordScreen(email: email, otp: otp));
        setLoading(false);
      },
    );
  }

  Future refreshToken() async {
    setLoading(true);

    final refreshToken = await _authStorageService.getRefreshToken();
    DPrint.log("Got refresh token: $refreshToken");
    final request = RefreshTokenRequestModel(refreshToken: refreshToken);

    final result = await _authRepository.refreshToken(request);

    final navi = result.fold(
      (fail) {
        DPrint.log("Refresh token failed: ${fail.message}");
        setLoading(false);
        return _isSuccess = false;
      },
      (success) async {
        DPrint.log("Refresh token success: ${success.message}");
        await _authStorageService.storeAccessToken(success.data.accessToken);
        await _authStorageService.storeRefreshToken(success.data.refreshToken);
        // _authStorageService.clearAuthData();
        setLoading(false);
        final role = await Get.find<AuthStorageService>().getRole();

      if (role == "user") {
        Get.offAll(() => DashboardScreen());
      } else if (role == "owner") {
        Get.offAll(() => OwnerNavScreen());
      } else {
        Get.offAll(() => LoginScreen());
      }

        
      },
    );
    return _isSuccess;
  }

  Future<void> logout() async {
    await _authStorageService.clearAuthData();
    Get.offAll(() => LoginScreen());
  }
}
