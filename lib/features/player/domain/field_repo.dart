import 'package:dio/dio.dart';
import 'package:flutter_carlos112mo/features/player/data/model/get_all_fields_response_model.dart';

import '../../../core/network/network_result.dart';
import '../data/model/get_single_fields_response_model.dart';

abstract class FieldRepository {
 
  NetworkResult<GetAllFieldsResponseModel> getAllField();

}