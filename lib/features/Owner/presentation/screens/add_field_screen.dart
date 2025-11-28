import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_carlos112mo/features/Owner/presentation/controllers/add_field_controller.dart';
import 'package:get/get.dart';
import '../../data/models/response_model/create_field_response_model.dart';
import '../controllers/field_controller.dart';
import 'package:image_picker/image_picker.dart';

class AddFieldScreen extends StatelessWidget {
  AddFieldScreen({super.key});

  final FieldController _controller = Get.find<FieldController>();
  final AddFieldController controller = AddFieldController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add New Field"), elevation: 0.5),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ---------- BASIC INFORMATION ----------
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Basic Information",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    _inputField(
                      "Field Name",
                      "e.g. Bosco Valley Field",
                      controller: controller.fieldNameController,
                    ),
                    const SizedBox(height: 12),
                    _inputField(
                      "Description",
                      "Describe your field...",
                      maxLines: 4,
                      controller: controller.descriptionController,
                    ),
                    const SizedBox(height: 12),
                    const Text("Field Type"),
                    const SizedBox(height: 8),

                    /// 👉 Field Type Buttons
                    Row(
                      children: ['5v5', '7v7', '11v11'].map((type) {
                        return Obx(() {
                          bool selected =
                              controller.selectedFieldType.value == type;
                          return GestureDetector(
                            onTap: () =>
                                controller.selectedFieldType.value = type,
                            child: Container(
                              margin: const EdgeInsets.only(right: 10),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: selected
                                    ? Color(0xFFE6F5F3)
                                    : Colors.white,
                                border: Border.all(color: Colors.grey.shade400),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                type,
                                style: TextStyle(
                                  color: selected
                                      ? Color(0xFF00917B)
                                      : Colors.black,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          );
                        });
                      }).toList(),
                    ),
                    SizedBox(height: 5,),

                    _inputField(
                      "Base Price Per Hour",
                      "Base Price Per Hour",
                      controller: controller.basePriceController,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            // ---------- TIME & PRICE ----------
            const Text(
              "Time & Date Base Price",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),

            Obx(() {
              // If list is empty, add a default empty PricePerHour temporarily
              if (controller.pricePerHourList.isEmpty) {
                controller.pricePerHourList.add(
                  PricePerHour(
                    date: DateTime.now().toIso8601String(),
                    startTime: '',
                    endTime: '',
                    pricePerHour: 0,
                    id: DateTime.now().toString(),
                  ),
                );
              }

              return Column(
                children: [
                  // Show all existing PricePerHour cards
                  for (int i = 0; i < controller.pricePerHourList.length; i++)
                    _timePriceCard(controller.pricePerHourList[i], i),

                  const SizedBox(height: 10),

                  // Add More button
                  ElevatedButton(
                    onPressed: () {
                      // controller.addPricePerHour(PricePerHour(
                      //   date: DateTime.now().toIso8601String(),
                      //   startTime: '',
                      //   endTime: '',
                      //   pricePerHour: 0,
                      //   id: DateTime.now().toString(),
                      // ));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      minimumSize: const Size(double.infinity, 48),
                    ),
                    child: const Text("+ Add More"),
                  ),
                ],
              );
            }),

            const SizedBox(height: 30),

            // ---------- LOCATION ----------\
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    const Text(
                      "Location",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    _inputField(
                      "Address",
                      "Enter full address",
                      controller: controller.addressController,
                    ),
                    const SizedBox(height: 12),

                    // Map placeholder
                    Container(
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: const Center(
                        child: Text("Map will be displayed here"),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            // ---------- SERVICES ----------
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Services & Amenities",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 15,
                      runSpacing: 8,
                      children: [
                        _checkItem("Showers", controller.showers),
                        _checkItem("Parking", controller.parking),
                        _checkItem("Cafe", controller.cafe),
                        _checkItem("Lights", controller.lights),
                        _checkItem("Changing Rooms", controller.changingRooms),
                        _checkItem(
                          "Equipment Rental",
                          controller.equipmentRental,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Images",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Obx(() {
                      return GestureDetector(
                        onTap: () async {
                          if (controller.image.value == null) {
                            await _pickImage();
                          }
                        },
                        child: Container(
                          height: 250,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: controller.image.value == null
                              ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.image_outlined,
                                  size: 50,
                                  color: Colors.grey,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  "Add Image",
                                  style: TextStyle(color: Colors.grey.shade600),
                                ),
                              ],
                            ),
                          )
                              : Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.file(
                                  controller.image.value!,
                                  width: double.infinity,
                                  height: 250,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                top: 8,
                                right: 8,
                                child: GestureDetector(
                                  onTap: controller.removeImage,
                                  child: const Icon(
                                    Icons.close,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                    const SizedBox(height: 5),
                    Text(
                      'Upload a high-quality image of your field. At least one image is required.',
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                  ],
                ),
              ),
            )
            ,

            const SizedBox(height: 20),

            /// 👉 Promotion Checkbox
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Make promotion',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    Row(
                      children: [
                        Obx(
                          () => Checkbox(
                            value: controller.isPromotion.value,
                            onChanged: (v) =>
                                controller.isPromotion.value = v ?? false,
                          ),
                        ),
                        const Text("Select and promote to all"),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // CREATE BUTTON
            Obx(
              () => ElevatedButton.icon(
                onPressed: _controller.isLoading.value ? null : _createField,
                label: Text(
                  _controller.isLoading.value ? "Creating..." : "Create Field",
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  minimumSize: const Size(double.infinity, 55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  Widget _inputField(
      String title,
      String? hint, {
        int maxLines = 1,
        TextEditingController? controller,
      }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hint,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.grey), // Normal border
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.blue, width: 2), // Focused border
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }


  Widget _timePriceCard(PricePerHour price, int index) {
    final startController = TextEditingController();
    final endController = TextEditingController();
    final priceController = TextEditingController();

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        children: [
          _inputField("Start Time", "09:00", controller: startController),
          const SizedBox(height: 8),
          _inputField("End Time", "18:00", controller: endController),
          const SizedBox(height: 8),
          _inputField("Price per Hour (\$)", '',  controller: priceController),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget _checkItem(String title, RxBool value) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Obx(
          () => Checkbox(
            value: value.value,
            onChanged: (v) => value.value = v ?? false,
          ),
        ),
        Text(title),
      ],
    );
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      controller.setImage(File(picked.path));
    }
  }


  Future<void> _createField() async {
    final location = Location(
      address: controller.addressController.text,
      coordinates: Coordinates(latitude: 0.0, longitude: 0.0),
    );

    final servicesAmenities = ServicesAmenities(
      showers: controller.showers.value,
      lights: controller.lights.value,
      parking: controller.parking.value,
      cafe: controller.cafe.value,
      changingRooms: controller.changingRooms.value,
      equipmentRental: controller.equipmentRental.value,
    );

    // await _controller.createField(
    //   // controller.fieldNameController.text,
    //   // controller.descriptionController.text,
    //   // controller.selectedFieldType.value,
    //   // controller.isPromotion.value,
    //   // controller.basePrice,
    //   // controller.pricePerHourList.isNotEmpty
    //   //     ? controller.pricePerHourList[0].pricePerHour
    //   //     : 0,
    //   // location,
    //   // servicesAmenities,
    //   // controller.images,
    // );
  }
}
