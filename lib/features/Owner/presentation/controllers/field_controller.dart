import 'dart:convert';
import 'dart:developer' as DPrint;
import 'dart:io';
import 'package:flutter_carlos112mo/features/Owner/data/domain/field_repository.dart';
import 'package:flutter_carlos112mo/features/Owner/presentation/screens/owner_home_screen.dart';
import 'package:get/get.dart';
import '../../../../core/base/base_controller.dart';
import '../../../../core/network/services/multiple_form_data_manager.dart';
import '../../data/models/response_model/create_field_response_model.dart';

class FieldController extends BaseController {
  final FieldRepo _fieldRepository;
  final MultiFormDataManager _multiFormDataManager = MultiFormDataManager();

  /// UI Reactive Variables
  var selectedFieldType = '5v5'.obs;
  var promotion = false.obs;

  /// Loading flags (if you need them)
  var isSkipLoading = false.obs;
  var isContinueLoading = false.obs;

  FieldController(this._fieldRepository);

  @override
  void onInit() {
    super.onInit();
  }

  /// Create Field API
  Future<void> createField(
    String fieldName,
    String description,
    String fieldType,
    bool promotion,
    int basePricePerHour,
    List<PricePerHour> pricePerHour,
    Location location,
    ServicesAmenities servicesAmenities,
    List<File> images,
  ) async {
    setLoading(true);
    setError('');

    _multiFormDataManager.clear(); // ADD THIS FIRST

    // Normal fields
    _multiFormDataManager.addTextData("fieldName", fieldName);
    _multiFormDataManager.addTextData("description", description);
    _multiFormDataManager.addTextData("fieldType", fieldType);

    // _multiFormDataManager.addTextData("promotion", promotion.toString());
    // _multiFormDataManager.addTextData("basePricePerHour", basePricePerHour.toString());

    //JSON body data
    // _multiFormDataManager.addTextData("location", jsonEncode(location.toJson()));
    // _multiFormDataManager.addTextData("servicesAmenities", jsonEncode(servicesAmenities.toJson()));
    //_multiFormDataManager.addTextData("pricePerHour", jsonEncode(pricePerHour.map((e) => e.toJson()).toList()));
    _multiFormDataManager.addTextData(
      "promotion",
      promotion ? 'true' : 'false',
    ); // safest
    _multiFormDataManager.addTextData(
      "pricePerHour",
      basePricePerHour.toString(),
    ); // if server expects string

    // Add list of PricePerHour as JSON array
    _multiFormDataManager.addTextData(
      "pricing",
      jsonEncode(
        pricePerHour
            .map(
              (e) => {
                "date": e.date,
                "startTime": e.startTime,
                "endTime": e.endTime,
                "pricePerHour": e.pricePerHour,
                // "id": e.id,
              },
            )
            .toList(),
      ),
    );

    _multiFormDataManager.addTextData("address", location.address);

    // Add Location as JSON object
    _multiFormDataManager.addTextData(
      "coordinates",
      jsonEncode({
        "latitude": location.coordinates.longitude,
        "longitude": location.coordinates.latitude,
      }), // [lng, lat]
    );

    // Add ServicesAmenities as JSON object
    _multiFormDataManager.addTextData(
      "servicesAmenities",
      jsonEncode({
        "showers": servicesAmenities.showers,
        "lights": servicesAmenities.lights,
        "parking": servicesAmenities.parking,
        "changingRooms": servicesAmenities.changingRooms,
        "cafe": servicesAmenities.cafe,
        "equipmentRental": servicesAmenities.equipmentRental,
      }),
    );

    //Images list
    _multiFormDataManager.addImageFiles(images);

    // Build FormData
    final formRequest = await _multiFormDataManager.toFormDataAsync();

    //API Call
    final result = await _fieldRepository.createNewField(formRequest);

    result.fold(
      (fail) {
        setError(fail.message);
        isLoading(false);
      },
      (success) {
        isLoading(false);
        setError(success.message);
        // Get.back();
        Get.to(() => OwnerHomeScreen()); // success — go back
      },
    );
  }
}
