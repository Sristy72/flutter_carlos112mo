import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_carlos112mo/features/Owner/presentation/controllers/add_field_controller.dart';
import 'package:get/get.dart';

class AddFieldScreen extends StatelessWidget {
  final bool isEdit;
  final String fieldId;
  AddFieldScreen({super.key, required this.isEdit, required this.fieldId, required model});

  final AddFieldController c = Get.put(AddFieldController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add New Field"), elevation: 0.5),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Basic Information",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),

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
                    _inputField(
                      "Field Name",
                      "e.g. Bosco Valley Field",
                      controller: c.fieldName,
                    ),
                    const SizedBox(height: 12),
                    _inputField(
                      "Description",
                      "Describe your field...",
                      controller: c.description,
                      maxLines: 4,
                    ),
                    const SizedBox(height: 12),
                    const Text("Field Type"),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        _typeButton("5v5", c),
                        const SizedBox(width: 10),
                        _typeButton("7v7", c),
                        const SizedBox(width: 10),
                        _typeButton("11v11", c),
                      ],
                    ),
                    const SizedBox(height: 10),
                    _inputField(
                      "Base PricePer Hour",
                      "Enter base price",
                      controller: c.basePrice,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            // TIME & PRICE
            const Text(
              "Time & Date Base Price",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            Obx(
              () => Column(
                children: [
                  for (int i = 0; i < c.timePriceList.length; i++)
                    Column(
                      children: [
                        _timePriceCard(c, i),
                        const SizedBox(height: 12)
                      ],
                    ),


                ],
              ),
            ),
            ElevatedButton(
              onPressed: c.addTimePriceCard,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                minimumSize: const Size(double.infinity, 48),
              ),
              child: const Text("+ Add More"),
            ),
            const SizedBox(height: 30),

            // LOCATION
            const Text(
              "Location",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    _inputField("Address", "Enter full address", controller: c.address),
                    const SizedBox(height: 12),
                    Container(
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: const Center(
                        child: Text("Map will be displayed here after saving"),
                      ),
                    ),
                  ],
                ),
              ),
            ),


            const SizedBox(height: 30),

            // SERVICES & AMENITIES
            const Text(
              "Services & Amenities",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            Obx(
              () => Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Wrap(
                  spacing: 15,
                  runSpacing: 8,
                  children: c.services.entries.map((entry) {
                    final label = entry.key == "changingRooms"
                        ? "Changing Rooms"
                        : entry.key == "equipmentRental"
                        ? "Equipment Rental"
                        : entry.key[0].toUpperCase() +
                              entry.key.substring(1); // Capitalize first letter
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Checkbox(
                          value: entry.value,
                          onChanged: (v) => c.services[entry.key] = v!,
                        ),
                        Text(label),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // IMAGES
            const Text(
              "Images",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),

            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () => c.pickImage(),
                  child: Obx(() {
                    if (c.images.isEmpty) {
                      return Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.image_outlined,
                            size: 40,
                            color: Colors.grey,
                          ),
                        ),
                      );
                    }
                    return Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey.shade300),
                        image: DecorationImage(
                          image: FileImage(File(c.images.last)),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
            const SizedBox(height: 20),

            Obx(
              () => Row(
                children: [
                  Checkbox(
                    value: c.promote.value,
                    onChanged: (v) => c.promote.value = v!,
                  ),
                  const Text("Select and promote to all"),
                ],
              ),
            ),
            const SizedBox(height: 20),

            ElevatedButton.icon(
              onPressed: c.createField,
              icon: const Icon(Icons.check_circle),
              label: const Text("Create Field"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                minimumSize: const Size(double.infinity, 55),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

/// ---------------- UI COMPONENTS ----------------
Widget _inputField(
  String title,
  String hint, {
  required TextEditingController controller,
  int maxLines = 1,
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
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    ],
  );
}

Widget _typeButton(String text, AddFieldController c) {
  return Obx(
    () => GestureDetector(
      onTap: () => c.selectedFieldType.value = text,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: c.selectedFieldType.value == text ? Color(0xFFE6F5F3) : null,
          border: Border.all(
            color: c.selectedFieldType.value == text
                ? Color(0xFF00917B)
                : Colors.grey.shade400,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 14, color: Color(0xFF00917B)),
        ),
      ),
    ),
  );
}

Widget _timePriceCard(AddFieldController c, int index) {
  final model = c.timePriceList[index];
  return Container(
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: Colors.grey.shade300),
    ),
    child: Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _timeField("Start Time", model.startTime, () async {
                final t = await c.pickTime(Get.context!, model.startTime.value);
                if (t != null) model.startTime.value = t;
              }),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: _timeField("End Time", model.endTime, () async {
                final t = await c.pickTime(Get.context!, model.endTime.value);
                if (t != null) model.endTime.value = t;
              }),
            ),
          ],
        ),
        const SizedBox(height: 12),
        _inputField("Price per Hour (\$)", "50", controller: model.price),
        const SizedBox(height: 12),
        _dateField(model.date, () async {
          final d = await c.pickDate(Get.context!);
          if (d != null) model.date.value = d;
        }),
        const SizedBox(height: 12),
        TextButton(
          onPressed: () => c.removeCard(index),
          child: const Text("Remove", style: TextStyle(color: Colors.red)),
        ),
      ],
    ),
  );
}

Widget _timeField(String label, RxString value, VoidCallback onTap) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label),
      const SizedBox(height: 6),
      GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(() => Text(value.value)),
              const Icon(Icons.access_time, size: 18),
            ],
          ),
        ),
      ),
    ],
  );
}

Widget _dateField(RxString date, VoidCallback onTap) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text("Date"),
      const SizedBox(height: 6),
      GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(() => Text(date.value)),
              const Icon(Icons.calendar_today, size: 18),
            ],
          ),
        ),
      ),
    ],
  );
}
