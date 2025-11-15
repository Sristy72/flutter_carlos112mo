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

  void setLoading(bool value) => isLoading.value = value;
  void setError(String message) => errorMessage.value = message;

  FieldPlayerController(this._fieldRepository);
  final RxList<GetAllFieldsResponseModel> fields =
      <GetAllFieldsResponseModel>[].obs;

  // final userProfileService = Get.find<GetUserProfileService>();
  final MultiFormDataManager _multiFormDataManager = MultiFormDataManager();

  Future<void> fetchField() async {
    setLoading(true);
    setError("");

    final result = await _fieldRepository.getAllField();

    result.fold(
      (fail) {
        setError(fail.message);
        DPrint.log('data fetch failed ${fail.message}');
        setLoading(false);
      },
      (success) {
        fields.assignAll(success.data); // ✅ Assign list directly
        DPrint.log(success.message);
        setLoading(false);
      },
    );
  }
}
