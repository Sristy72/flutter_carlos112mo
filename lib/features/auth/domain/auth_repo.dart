import 'package:flutter_carlos112mo/features/auth/data/model/auth_request_model.dart';
import 'package:flutter_carlos112mo/features/auth/data/model/auth_response_model.dart';

import '../../../core/network/network_result.dart';
import '../data/model/register_request_model.dart';
import '../data/model/register_response_model.dart';

abstract class AuthRepository {
  NetworkResult<AuthResponseModel> login(AuthRequestModel request);
  NetworkResult<RegisterResponseModel> register(RegisterRequestModel request);
}
