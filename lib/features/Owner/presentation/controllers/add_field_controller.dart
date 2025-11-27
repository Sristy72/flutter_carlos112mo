import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../data/models/response_model/create_field_response_model.dart';

class AddFieldController extends GetxController {
  // Basic Info
  final fieldNameController = TextEditingController();
  final basePriceController = TextEditingController();
  late int basePrice = int.tryParse(basePriceController.text) ?? 0;
  final descriptionController = TextEditingController();
  var selectedFieldType = '5v5'.obs;

  Rx<File?> image = Rx<File?>(null);

  void removeImage() {
    image.value = null;
    images.clear();
  }


  void setImage(File pickedImage) {
    image.value = pickedImage;
    images.clear();               // Ensure only one image or multiple if needed later
    images.add(pickedImage);      // Add to the list used for upload
  }


  // Time & Price
  var pricePerHourList = <PricePerHour>[].obs;

  // Location
  final addressController = TextEditingController();
  final latitudeController = TextEditingController();
  final longitudeController = TextEditingController();

  // Services & Amenities
  var showers = false.obs;
  var lights = false.obs;
  var parking = false.obs;
  var changingRooms = false.obs;
  var cafe = false.obs;
  var equipmentRental = false.obs;

  // Promotion
  var isPromotion = false.obs;

  // Images
  var images = <File>[].obs;

  // Add a new PricePerHour entry
  void addPricePerHour(PricePerHour price) {
    pricePerHourList.add(price);
  }

  // Build the CreateFieldRequest from current values
  CreateFieldResponseModel toModel() {
    return CreateFieldResponseModel(
      id: '',
      fieldName: fieldNameController.text,
      description: descriptionController.text,
      fieldType: selectedFieldType.value,
      promotion: isPromotion.value,
      basePricePerHour: pricePerHourList.isNotEmpty ? pricePerHourList[0].pricePerHour : 0,
      pricePerHour: pricePerHourList,
      location: Location(
        address: addressController.text,
        coordinates: Coordinates(
          latitude: double.tryParse(latitudeController.text) ?? 0,
          longitude: double.tryParse(longitudeController.text) ?? 0,
        ),
      ),
      servicesAmenities: ServicesAmenities(
        showers: showers.value,
        lights: lights.value,
        parking: parking.value,
        changingRooms: changingRooms.value,
        cafe: cafe.value,
        equipmentRental: equipmentRental.value,
      ),
      images: images,
      owner: '', // Set dynamically
      isActive: true,
      rating: Rating(average: 0, count: 0),
      createdAt: '',
      updatedAt: '',
    );
  }
}
