import 'package:flutter/material.dart';
import 'package:flutter_carlos112mo/features/player/domain/find_field_repo.dart';
import 'package:get/get.dart';
import '../../../../core/utils/debug_print.dart';
import '../../data/model/find_field_model.dart';
import '../../data/model/get_single_fields_response_model.dart';

class FindFieldController extends GetxController {
  final FindFieldRepository _findfieldRepository;
  FindFieldController(this._findfieldRepository);

  var venue = Rx<SingleFieldsResponseModel?>(null);
  final selectedFieldId = "".obs;
  var isLoading = false.obs;
  var errorMessage = "".obs;
  void setLoading(bool value) => isLoading.value = value;
  void setError(String message) => errorMessage.value = message;

  Future<void> fetchSingleField() async {
    if (selectedFieldId.isEmpty) return;
    setLoading(true);
    final result = await _findfieldRepository.getFieldsById(
      selectedFieldId.value,
    );

    result.fold(
      (fail) {
        setLoading(false);
      },
      (success) {
        venue.value = success.data;
        setLoading(false);
      },
    );
  }

 

  void checkAvailability() {
    Get.snackbar("Availability", "Feature coming soon!");
  }
}
