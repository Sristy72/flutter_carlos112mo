import '../../../core/network/network_result.dart';
import '../data/model/get_single_fields_response_model.dart';

abstract class FindFieldRepository {
  NetworkResult<SingleFieldsResponseModel> getFieldsById(String id);
}
