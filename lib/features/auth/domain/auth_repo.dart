import 'package:flutter_carlos112mo/features/auth/data/model/auth_request_model.dart';
import 'package:flutter_carlos112mo/features/auth/data/model/auth_response_model.dart';

import '../../../core/network/network_result.dart';

abstract class AuthRepository {
  NetworkResult<AuthResponseModel> login(AuthRequestModel request);
}
