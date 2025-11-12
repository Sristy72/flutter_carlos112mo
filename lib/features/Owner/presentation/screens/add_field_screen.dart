import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../core/common/widgets/bottom_navigation_bar.dart';
import '../../../../core/theme/app_colors.dart';
import '../controllers/add_field_controller.dart';
import '../widget/custom_text_field.dart';
import 'dashboard_edit_field.dart';
import 'owner_home_screen.dart';

class AddFieldScreen extends StatelessWidget {
  final AddFieldController controller = Get.put(AddFieldController());

  AddFieldScreen({super.key});

  final List<String> amenities = [
    'showers',
    'parking',
    'cafe',
    'lights',
    'changing rooms',
    'equipment rental',
  ];

  final Set<String> selectedAmenities = {};
  bool makePromotion = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.primaryGreen,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: const [
                Icon(Icons.location_on_outlined, color: Colors.white, size: 18),
                SizedBox(width: 4),
                Text(
                  'Arequipa, Peru',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Row(
              children: const [
                Text(
                  'Kejim bb',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 6),
                 CircleAvatar(
                  radius: 16,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, color: Colors.grey, size: 20),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Add New Field',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryBlack,
              ),
            ),
            const SizedBox(height: 24),

            // ===== Basic Info Section =====
            _buildCard(
              title: "Basic Information",
              children: [
                CustomTextField(
                  label: "Field Name ",
                  controller: controller.fieldNameController,
                  hintText: "e.g. Green Valley Field",
                  isRequired: true,
                ),
                CustomTextField(
                  label: "Description ",
                  controller: controller.descriptionController,
                  hintText: "Describe your field...",
                  isRequired: true,
                ),
                const Text(
                  "Field Type *",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: ["5v5", "6v6", "11v11"].map((type) {
                      final isSelected = controller.fieldType.value == type;
                      return Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: isSelected
                                  ? AppColors.iconBg
                                  : AppColors.primaryWhite,
                              foregroundColor: AppColors.primaryBlack,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: const BorderSide(
                                  color: AppColors.primaryGreen,
                                  width: 1,
                                ),
                              ),
                            ),
                            onPressed: () => controller.setFieldType(type),
                            child: Text(type),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // ===== Time & Price Section =====
            _buildCard(
              title: "Time & Date base Price",
              children: [
                Obx(
                  () => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: _buildTimeRow(
                              context,
                              "Start Time",
                              controller.startTime.value,
                              () => controller.pickStartTime(context),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: _buildTimeRow(
                              context,
                              "End Time",
                              controller.endTime.value,
                              () => controller.pickEndTime(context),
                            ),
                          ),
                        ],
                      ),
                      CustomTextField(
                        label: "Price per Hour (\$)",
                        controller: controller.priceController,
                        keyboardType: TextInputType.number,
                        isRequired: true,
                      ),
                      _buildDatePicker(context),
                      const SizedBox(height: 16),
                      const Divider(
                        color: AppColors.primaryGreen,
                        thickness: 2,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: _buildTimeRow(
                              context,
                              "Start Time",
                              controller.startTime.value,
                              () => controller.pickStartTime(context),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: _buildTimeRow(
                              context,
                              "End Time",
                              controller.endTime.value,
                              () => controller.pickEndTime(context),
                            ),
                          ),
                        ],
                      ),
                      CustomTextField(
                        label: "Price per Hour (\$)",
                        hintText: "80",
                        controller: controller.priceController,
                        keyboardType: TextInputType.number,
                        isRequired: true,
                      ),
                      _buildDatePicker(context),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryGreen,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                          icon: const Icon(Icons.add, color: Colors.white),
                          label: const Text(
                            "Add More",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: controller.addMoreSlot,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // ===== Location Section =====
            _buildCard(
              title: "Location",
              children: [
                _buildLabel('Address *'),
                TextField(
                  controller: controller.addressController,
                  decoration: InputDecoration(
                    hintText: 'Enter full address',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                _buildLabel('Map Location'),
                Container(
                  height: 120,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    'Map will be displayed here after saving',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'The map location will be automatically set based on the address you provide.',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // ===== Services & Amenities =====
            _buildCard(
              title: "Services & Amenities",
              children: [
                Obx(() {
                  final items = amenities;
                  final leftItems = items
                      .take((items.length / 2).ceil())
                      .toList();
                  final rightItems = items
                      .skip((items.length / 2).ceil())
                      .toList();

                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Left Column
                      Expanded(
                        child: Column(
                          children: leftItems.map((item) {
                            return CheckboxListTile(
                              title: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: AppColors.subText,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              value: controller.selectedAmenities.contains(
                                item,
                              ),
                              onChanged: (value) => controller.toggleAmenity(
                                item,
                                value ?? false,
                              ),
                              controlAffinity: ListTileControlAffinity.leading,
                              dense: true,
                              contentPadding: EdgeInsets.zero,
                              activeColor: AppColors.primaryGreen,
                            );
                          }).toList(),
                        ),
                      ),

                      const SizedBox(width: 16),

                      // Right Column
                      Expanded(
                        child: Column(
                          children: rightItems.map((item) {
                            return CheckboxListTile(
                              title: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: AppColors.subText,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              value: controller.selectedAmenities.contains(
                                item,
                              ),
                              onChanged: (value) => controller.toggleAmenity(
                                item,
                                value ?? false,
                              ),
                              controlAffinity: ListTileControlAffinity.leading,
                              dense: true,
                              contentPadding: EdgeInsets.zero,
                              activeColor: AppColors.primaryGreen,
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  );
                }),
              ],
            ),

            const SizedBox(height: 20),

            // ===== Images =====
            _buildCard(
              title: "Images",

              children: [
                GestureDetector(
                  onTap: controller.pickImage,
                  child: Container(
                    height: 120,
                    width: 140,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.image_outlined, color: Colors.grey),
                          SizedBox(height: 8),
                          Text(
                            'Add Image',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Upload high-quality images of your field. At least one image is required.',
                  style: TextStyle(
                    color: AppColors.subText,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // ===== Make Promotion =====
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Make Promotion",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Obx(
                    () => CheckboxListTile(
                      value: controller.makePromotion.value,
                      onChanged: (value) =>
                          controller.makePromotion.value = value ?? false,
                      title: const Text(
                        'Select and promote to all',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.subText,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      controlAffinity: ListTileControlAffinity.leading,
                      dense: true,
                      activeColor: AppColors.primaryGreen,
                      tileColor: Colors.transparent,
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // ===== Create Field Button =====
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryGreen,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Create Field',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),

            const SizedBox(height: 50),
          ],
        ),
      ),

      bottomNavigationBar: CustomBottomNavBar(
        onTap: (index) {
          // Optional navigation logic
          if (index == 0) {
            Get.to(() => const OwnerHomeScreen());

            // Get.toNamed('/home');
          } else if (index == 1) {
            Get.to(() => const OwnerDashboardEditScreen());
            // Get.toNamed('/dashboard');
          } else if (index == 2) {
            // Get.toNamed('/myFields');
            Get.to(() => AddFieldScreen());
          } else if (index == 3) {
            Get.toNamed('/profile');
          }
        },
      ),
    );
  }

  // ===== Helper Widgets =====

  Widget _buildCard({required String title, required List<Widget> children}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: AppColors.primaryBlack,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 12),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildTimeRow(
    BuildContext context,
    String label,
    TimeOfDay time,
    VoidCallback onTap,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            color: AppColors.primaryBlack,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 6),
        InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey.shade400),
            ),
            child: Row(
              children: [
                const Icon(Icons.access_time, size: 18),
                const SizedBox(width: 8),
                Text(
                  time.format(context),
                  style: const TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }

  Widget _buildDatePicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Date",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            color: AppColors.primaryBlack,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),
        InkWell(
          onTap: () => controller.pickDate(context),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey.shade400),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_today_outlined,
                      size: 18,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      DateFormat(
                        'MMMM d, yyyy',
                      ).format(controller.selectedDate.value),
                      style: const TextStyle(color: Colors.black),
                    ),
                  ],
                ),
                const Icon(Icons.arrow_drop_down, color: Colors.grey),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          color: Colors.black,
          fontSize: 14,
        ),
      ),
    );
  }
}
