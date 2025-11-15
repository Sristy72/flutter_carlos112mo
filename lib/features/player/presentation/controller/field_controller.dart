import 'package:flutter_carlos112mo/features/player/data/model/get_all_fields_response_model.dart';
import 'package:flutter_carlos112mo/features/player/domain/field_repo.dart';
import 'package:get/get.dart';

import '../../../../core/base/base_controller.dart';
import '../../../../core/network/services/multiple_form_data_manager.dart';
import '../../../../core/utils/debug_print.dart';

class FieldPlayerController extends BaseController {
  final FieldRepository _fieldRepository;

  var isLoading = false.obs;
  var errorMessage = "".obs;
  var searchQuery = "".obs;

  void setLoading(bool value) => isLoading.value = value;
  void setError(String message) => errorMessage.value = message;

  FieldPlayerController(this._fieldRepository);
final Rx<GetAllFieldsResponseModel?> fields = Rx(null);

Future<void> fetchField() async {
  setLoading(true);

  final result = await _fieldRepository.getAllField();

  result.fold(
    (fail) {
      setError(fail.message);
      setLoading(false);
    },
    (success) {
      fields.value = success.data;
      setLoading(false);
    },
  );
}



void setSearchQuery(String value) {
  searchQuery.value = value;
}
List<Field> get filteredFields {
  if (fields.value == null) return [];

  final allFields = fields.value!.fields;

  if (searchQuery.value.isEmpty) return allFields;

  return allFields.where((field) {
    final name = field.fieldName.toLowerCase();
    final address = field.location.address.toLowerCase();
    final q = searchQuery.value.toLowerCase();

    return name.contains(q) || address.contains(q);
  }).toList();
}


}
