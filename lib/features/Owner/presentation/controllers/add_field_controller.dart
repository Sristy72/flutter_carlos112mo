import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class TimePriceModel {
  TextEditingController price = TextEditingController();
  RxString startTime = "09:00 am".obs;
  RxString endTime = "10:00 am".obs;
  RxString date = "September 14, 2025".obs;
}

class AddFieldController extends GetxController {
  // Basic Info
  TextEditingController fieldName = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController basePrice = TextEditingController();
  TextEditingController address = TextEditingController();

  // Field Type
  RxString selectedFieldType = "".obs;

  // Services
  RxMap<String, bool> services = {
    "showers": false,
    "parking": false,
    "cafe": false,
    "lights": false,
    "changing rooms": false,
    "equipment rental": false,
  }.obs;

  // Images
  RxList<String> images = <String>[].obs;

  // Promote
  RxBool promote = false.obs;

  // Dynamic Time & Price Cards
  RxList<TimePriceModel> timePriceList = <TimePriceModel>[].obs;

  void addTimePriceCard() {
    timePriceList.add(TimePriceModel());
  }

  void removeCard(int index) {
    timePriceList.removeAt(index);
  }

  // Pick Time
  Future<String?> pickTime(BuildContext context, String initial) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    return picked != null ? picked.format(context) : null;
  }

  // Pick Date
  Future<String?> pickDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      initialDate: DateTime.now(),
    );
    if (picked == null) return null;

    return "${picked.day}-${picked.month}-${picked.year}";
  }

  // Pick Image
  Future pickImage() async {
    final picker = ImagePicker();
    final file = await picker.pickImage(source: ImageSource.gallery);
    if (file != null) images.add(file.path);
  }

  // Create Field
  void createField() {
    print("Field Name: ${fieldName.text}");
    print("Description: ${description.text}");
    print("Address: ${address.text}");
    print("Field Type: ${selectedFieldType.value}");
    print("Promote: ${promote.value}");
    print("Images: ${images.toList()}");

    print("Services:");
    services.forEach((key, value) {
      print("  $key: $value");
    });

    print("Time & Price:");
    for (var card in timePriceList) {
      print("Start: ${card.startTime.value}");
      print("End: ${card.endTime.value}");
      print("Date: ${card.date.value}");
      print("Price: ${card.price.text}");
    }
  }
}
