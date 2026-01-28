import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../data/models/response_model/create_field_response_model.dart';
import 'field_controller.dart';

class TimePriceModel {
  TextEditingController price = TextEditingController();
  RxString startTime = "09:00 am".obs;
  RxString endTime = "10:00 am".obs;
  RxString date = "".obs;
}

class AddFieldController extends GetxController {
  // ---------------- BASIC INFO ----------------
  TextEditingController fieldName = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController basePrice = TextEditingController();
  TextEditingController address = TextEditingController();

  final FieldController fieldController = Get.find<FieldController>();

  // ---------------- FIELD TYPE ----------------
  RxString selectedFieldType = "".obs;

  // ---------------- SERVICES ----------------
  RxMap<String, bool> services = <String, bool>{
    "showers": false,
    "lights": false,
    "parking": false,
    "changingRooms": false,
    "cafe": false,
    "equipmentRental": false,
  }.obs;

  ServicesAmenities get servicesModel {
    return ServicesAmenities(
      showers: services["showers"] ?? false,
      lights: services["lights"] ?? false,
      parking: services["parking"] ?? false,
      changingRooms: services["changingRooms"] ?? false,
      cafe: services["cafe"] ?? false,
      equipmentRental: services["equipmentRental"] ?? false,
    );
  }

  // ---------------- IMAGES ----------------
  RxList<String> images = <String>[].obs; // local + existing URLs

  // ---------------- PROMOTE ----------------
  RxBool promote = false.obs;

  // ---------------- TIME & PRICE ----------------
  RxList<TimePriceModel> timePriceList = <TimePriceModel>[].obs;

  // ---------------- EDIT MODE SUPPORT ----------------
  RxString editingFieldId = "".obs;

  @override
  void onInit() {
    super.onInit();
    if (timePriceList.isEmpty) addTimePriceCard();
  }

  void addTimePriceCard() {
    timePriceList.add(TimePriceModel());
  }

  void removeCard(int index) {
    if (timePriceList.length == 1) {
      Get.snackbar("Warning", "At least one time & price is required.");
      return;
    }
    timePriceList.removeAt(index);
  }

  // ---------------- PICK TIME ----------------
  Future<String?> pickTime(BuildContext context, String initial) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    return picked?.format(context);
  }

  // ---------------- PICK DATE ----------------
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

  // ---------------- PICK IMAGE ----------------
  Future pickImage() async {
    final file = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (file != null) images.add(file.path);
  }

  // -------------------- PREFILL (EDIT MODE) ---------------------
  void setInitialValues(CreateFieldResponseModel model) {
    editingFieldId.value = model.id ?? "";

    // ---- BASIC ----
    fieldName.text = model.fieldName ?? "";
    description.text = model.description ?? "";
    selectedFieldType.value = model.fieldType ?? "";
    promote.value = model.promotion ?? false;

    // ---- LOCATION ----
    address.text = model.location?.address ?? "";

    // ---- PRICING ----
    basePrice.text = model.basePricePerHour?.toString() ?? "";

    timePriceList.clear();
    if (model.pricePerHour != null) {
      for (var i in model.pricePerHour!) {
        final tp = TimePriceModel();
        tp.date.value = i.date ?? "";
        tp.startTime.value = i.startTime ?? "";
        tp.endTime.value = i.endTime ?? "";
        tp.price.text = i.pricePerHour.toString();
        timePriceList.add(tp);
      }
    }

    // ---- IMAGES (URL only, do not convert to File) ----
    images.clear();
    if (model.images != null) {
      for (var img in model.images!) {
        if (img.url != null && img.url!.isNotEmpty) {
          images.add(img.url!); // keep URL for display
        }
      }
    }

    // ---- SERVICES ----
    services["showers"] = model.servicesAmenities?.showers ?? false;
    services["lights"] = model.servicesAmenities?.lights ?? false;
    services["parking"] = model.servicesAmenities?.parking ?? false;
    services["changingRooms"] = model.servicesAmenities?.changingRooms ?? false;
    services["cafe"] = model.servicesAmenities?.cafe ?? false;
    services["equipmentRental"] = model.servicesAmenities?.equipmentRental ?? false;

    update();
  }

  // ---------------- CREATE FIELD ----------------
  void createField() async {
    final List<PricePerHour> priceList = timePriceList.map((e) {
      return PricePerHour(
        date: e.date.value,
        startTime: e.startTime.value,
        endTime: e.endTime.value,
        pricePerHour: int.tryParse(e.price.text) ?? 0,
        id: "",
      );
    }).toList();

    final locationModel = Location(
      address: address.text,
      coordinates: Coordinates(latitude: 0, longitude: 0),
      mapUrl: "",
    );

    final List<File> imgFiles = images.where((e) => !e.startsWith("http")).map((e) => File(e)).toList();

    await fieldController.createField(
      fieldName.text,
      description.text,
      selectedFieldType.value,
      promote.value,
      int.tryParse(basePrice.text) ?? 0,
      priceList,
      locationModel,
      servicesModel,
      imgFiles,
    );
  }
}
