import 'package:dio/dio.dart';
import 'package:flutter_carlos112mo/features/player/data/model/get_all_fields_response_model.dart';

import '../../../core/network/network_result.dart';

abstract class FieldRepository {
 
  NetworkResult<List<GetAllFieldsResponseModel>> getAllField();
}