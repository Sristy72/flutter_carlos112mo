import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddFieldController extends GetxController {
  // ==== Text Controllers ====
  final fieldNameController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  final addressController = TextEditingController();

  // ==== Reactive Variables ====
  var fieldType = '5v5'.obs;
  var selectedDate = DateTime.now().obs;
  var startTime = TimeOfDay(hour: 9, minute: 0).obs;
  var endTime = TimeOfDay(hour: 12, minute: 0).obs;

  var selectedAmenities = <String>[].obs;
  var makePromotion = false.obs;
  var pickedImages = <XFile>[].obs;

  final ImagePicker _picker = ImagePicker();

  // ==== Field Type ====
  void setFieldType(String type) => fieldType.value = type;

  // ==== Date & Time Pickers ====
  Future<void> pickDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null) selectedDate.value = picked;
  }

  Future<void> pickStartTime(BuildContext context) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: startTime.value,
    );
    if (picked != null) startTime.value = picked;
  }

  Future<void> pickEndTime(BuildContext context) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: endTime.value,
    );
    if (picked != null) endTime.value = picked;
  }

  // ==== Amenities Toggle ====
  void toggleAmenity(String amenity, bool isSelected) {
    if (isSelected) {
      if (!selectedAmenities.contains(amenity)) {
        selectedAmenities.add(amenity);
      }
    } else {
      selectedAmenities.remove(amenity);
    }
  }

  // ==== Image Picker ====
  Future<void> pickImage() async {
    final picked = await _picker.pickMultiImage();
    if (picked.isNotEmpty) {
      pickedImages.addAll(picked);
      Get.snackbar('Success', '${picked.length} images selected!');
    }
  }

  // ==== Add Time Slot ====
  void addMoreSlot() {
    Get.snackbar("Added", "New time slot added!");
  }

  @override
  void onClose() {
    fieldNameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    addressController.dispose();
    super.onClose();
  }
}
