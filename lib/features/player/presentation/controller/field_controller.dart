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

  void applyFilter({
    String fieldType = "",
    Map<String, bool>? services,
    double? minPrice,
    double? maxPrice,
  }) {
    if (fields.value == null) return;

    final allFields = fields.value!.fields;

    // Filter by field type
    List<Field> filtered = fieldType.isEmpty
        ? allFields
        : allFields.where((f) => f.fieldType == fieldType).toList();

    // Filter by services
    if (services != null && services.values.any((v) => v)) {
      filtered = filtered.where((f) {
        bool matches = true;
        if (services["showers"] == true) matches &= f.servicesAmenities.showers;
        if (services["lights"] == true) matches &= f.servicesAmenities.lights;
        if (services["parking"] == true) matches &= f.servicesAmenities.parking;
        if (services["changingRooms"] == true)
          matches &= f.servicesAmenities.changingRooms;
        if (services["cafe"] == true) matches &= f.servicesAmenities.cafe;
        if (services["equipmentRental"] == true)
          matches &= f.servicesAmenities.equipmentRental;
        return matches;
      }).toList();
    }

    // Filter by price
    if (minPrice != null && maxPrice != null) {
      filtered = filtered
          .where(
            (f) => f.pricePerHour >= minPrice && f.pricePerHour <= maxPrice,
          )
          .toList();
    }

    // Apply search query on top of filter
    if (searchQuery.value.isNotEmpty) {
      final q = searchQuery.value.toLowerCase();
      filtered = filtered.where((f) {
        final name = f.fieldName.toLowerCase();
        final address = f.location.address.toLowerCase();
        return name.contains(q) || address.contains(q);
      }).toList();
    }

    fields.value = GetAllFieldsResponseModel(
      fields: filtered,
      totalFields: filtered.length,
      totalPages: 1,
      currentPage: 1,
    );
  }
}
