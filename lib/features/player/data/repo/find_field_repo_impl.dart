import 'package:dio/dio.dart';
import 'package:flutter_carlos112mo/features/player/data/model/get_all_fields_response_model.dart';
import 'package:flutter_carlos112mo/features/player/data/model/get_single_fields_response_model.dart';

import '../../../../core/network/api_client.dart';
import '../../../../core/network/constants/api_constants.dart';
import '../../../../core/network/network_result.dart';
import '../../domain/field_repo.dart';
import '../../domain/find_field_repo.dart';

class FindFieldRepositoryImpl implements FindFieldRepository {
  final ApiClient _apiClient;

  FindFieldRepositoryImpl({required ApiClient apiClient}) : _apiClient = apiClient;



 @override
  NetworkResult<SingleFieldsResponseModel> getFieldsById(String id) {
    return _apiClient.get(
    ApiConstants.field.getFieldsById(id),
      fromJsonT: (json) {
        if (json == null) {
          throw Exception("API returned null for getFieldsById");
        }
        return SingleFieldsResponseModel.fromJson(json as Map<String, dynamic>);
      },
    );
  }

}
