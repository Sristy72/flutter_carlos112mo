import 'package:dio/dio.dart';
import 'package:flutter_carlos112mo/features/player/data/model/get_all_fields_response_model.dart';

import '../../../../core/network/api_client.dart';
import '../../../../core/network/constants/api_constants.dart';
import '../../../../core/network/network_result.dart';
import '../../domain/field_repo.dart';

class FieldRepositoryImpl implements FieldRepository {
  final ApiClient _apiClient;

  FieldRepositoryImpl({required ApiClient apiClient}) : _apiClient = apiClient;

  @override
  NetworkResult<List<GetAllFieldsResponseModel>> getAllField() {
    return _apiClient.get<List<GetAllFieldsResponseModel>>(
      ApiConstants.field.getFields,
      fromJsonT: (json) {
        final dataList = json as List<dynamic>;
        return dataList
            .map((item) => GetAllFieldsResponseModel.fromJson(item))
            .toList();
      },
    );
  }
}
