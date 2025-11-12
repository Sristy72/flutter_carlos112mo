import '../../../../core/network/api_client.dart';
import '../../../../core/network/constants/api_constants.dart';
import '../../../../core/network/network_result.dart';
import '../../domain/auth_repo.dart';
import '../model/auth_request_model.dart';
import '../model/auth_response_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final ApiClient _apiClient;

  AuthRepositoryImpl({required ApiClient apiClient}) : _apiClient = apiClient;

  @override
  NetworkResult<AuthResponseModel> login(AuthRequestModel request) {
    return _apiClient.post<AuthResponseModel>(
      ApiConstants.auth.login,
      data: request.toJson(),
      fromJsonT: (json) => AuthResponseModel.fromJson(json),
      // isFormData: true
    );
  }
}
