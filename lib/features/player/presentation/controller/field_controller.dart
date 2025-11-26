import 'package:flutter_carlos112mo/features/player/data/model/get_all_fields_response_model.dart';
import 'package:flutter_carlos112mo/features/player/data/model/get_single_fields_response_model.dart';
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
  late List<Field> originalFields = [];

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
        originalFields = success.data.fields;

        setLoading(false);
      },
    );
  }

  // void setSearchQuery(String value) {
  //   searchQuery.value = value;
  // }

  // List<Field> get filteredFields {
  //   if (fields.value == null) return [];

  //   final allFields = fields.value!.fields;

  //   if (searchQuery.value.isEmpty) return allFields;

  //   return allFields.where((field) {
  //     final name = field.fieldName.toLowerCase();
  //     final address = field.location.address.toLowerCase();
  //     final q = searchQuery.value.toLowerCase();

  //     return name.contains(q) || address.contains(q);
  //   }).toList();
  // }

  void applyFilter({
  String fieldType = "",
  Map<String, bool>? services,
  double? minPrice,
  double? maxPrice,
}) {
  if (originalFields.isEmpty) return;

  List<Field> filtered = List.from(originalFields);

  // Filter by field type
  if (fieldType.isNotEmpty) {
    filtered = filtered.where((f) => f.fieldType == fieldType).toList();
  }

  // Filter by services (null-safe)
  if (services != null && services.values.any((v) => v)) {
    filtered = filtered.where((f) {
      final amenities = f.servicesAmenities;
      if (amenities == null) return false;

      bool matches = true;

      if (services["showers"] == true) matches &= amenities.showers ?? false;
      if (services["lights"] == true) matches &= amenities.lights ?? false;
      if (services["parking"] == true) matches &= amenities.parking ?? false;
      if (services["changing rooms"] == true) matches &= amenities.changingRooms ?? false;
      if (services["cafe"] == true) matches &= amenities.cafe ?? false;
      if (services["equipment rental"] == true) matches &= amenities.equipmentRental ?? false;

      return matches;
    }).toList();
  }

  // Price range (safe comparison)
  if (minPrice != null && maxPrice != null) {
    filtered = filtered.where((f) {
      final price = f.pricePerHour ?? f.basePricePerHour;
      if (price == null) return false;
      return price >= minPrice && price <= maxPrice;
    }).toList();
  }

  // Search query
  if (searchQuery.value.isNotEmpty) {
    final q = searchQuery.value.toLowerCase();
    filtered = filtered.where((f) {
      final name = (f.fieldName ?? '').toLowerCase();
      final address = (f.location?.address ?? '').toLowerCase();
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

List<Field> get filteredFields {
  if (fields.value == null) return [];

  final allFields = fields.value!.fields;

  if (searchQuery.value.isEmpty) return allFields;

  final q = searchQuery.value.toLowerCase();
  return allFields.where((field) {
    final name = (field.fieldName ?? '').toLowerCase();
    final address = (field.location?.address ?? '').toLowerCase();
    return name.contains(q) || address.contains(q);
  }).toList();
}

  
}
