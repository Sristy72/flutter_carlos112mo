import 'package:dio/dio.dart';
import 'package:flutter_carlos112mo/features/player/data/model/get_all_fields_response_model.dart';
import 'package:flutter_carlos112mo/features/player/data/model/get_single_fields_response_model.dart';

import '../../../../core/network/api_client.dart';
import '../../../../core/network/constants/api_constants.dart';
import '../../../../core/network/network_result.dart';
import '../../domain/field_repo.dart';

class FieldRepositoryImpl implements FieldRepository {
  final ApiClient _apiClient;

  FieldRepositoryImpl({required ApiClient apiClient}) : _apiClient = apiClient;

 @override
NetworkResult<GetAllFieldsResponseModel> getAllField() {
  return _apiClient.get<GetAllFieldsResponseModel>(
    ApiConstants.field.getFields,
    fromJsonT: (json) => GetAllFieldsResponseModel.fromJson(json),
  );
}

 

}
