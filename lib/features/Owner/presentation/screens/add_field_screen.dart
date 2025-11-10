// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_connect/http/src/utils/utils.dart';
// import '../../../../core/theme/app_colors.dart';
// import '../controllers/add_field_controller.dart';
// import '../widget/custom_text_field.dart';

// import 'package:intl/intl.dart';

// class AddFieldScreen extends StatelessWidget {
//   final AddFieldController controller = Get.put(AddFieldController());

//   AddFieldScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         backgroundColor: AppColors.primaryGreen, // Teal-green header
//         elevation: 0,
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Row(
//               children: const [
//                 Icon(Icons.location_on_outlined, color: Colors.white, size: 18),
//                 SizedBox(width: 4),
//                 Text(
//                   'Arequipa, Peru',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 15,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ],
//             ),
//             Row(
//               children: [
//                 const Text(
//                   'Kejim bb',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 14,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//                 const SizedBox(width: 6),
//                 const CircleAvatar(
//                   radius: 16,
//                   // backgroundImage: AssetImage(
//                   //   'assets/images/profile_photo.png',
//                   // ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,

//           children: [
//             const Text(
//               'Add New Field',
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w600,
//                 color: AppColors.primaryBlack,
//               ),
//             ),
//             const SizedBox(height: 24),
//             // ===== Basic Info Section =====
//             Card(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(16),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text(
//                       "Basic Information",
//                       style: TextStyle(
//                         fontWeight: FontWeight.w500,
//                         color: AppColors.primaryBlack,
//                         fontSize: 16,
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                     CustomTextField(
//                       label: "Field Name ",
//                       controller: controller.fieldNameController,
//                       hintText: "e.g. Green Valley Field",
//                       isRequired: true,
//                     ),
//                     CustomTextField(
//                       label: "Description ",
//                       controller: controller.descriptionController,
//                       hintText: "Describe your field...",
//                       isRequired: true,
//                     ),
//                     const Text(
//                       "Field Type *",
//                       style: TextStyle(fontWeight: FontWeight.w600),
//                     ),
//                     const SizedBox(height: 8),
//                     Obx(
//                       () => Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: ["5v5", "6v6", "11v11"].map((type) {
//                           final isSelected = controller.fieldType.value == type;
//                           return Expanded(
//                             child: Padding(
//                               padding: const EdgeInsets.symmetric(
//                                 horizontal: 4,
//                               ),
//                               child: ElevatedButton(
//                                 style: ElevatedButton.styleFrom(
//                                   backgroundColor: isSelected
//                                       ? AppColors.iconBg
//                                       : AppColors.primaryWhite,
//                                   foregroundColor: isSelected
//                                       ? AppColors.primaryBlack
//                                       : AppColors.primaryBlack,
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(8),
//                                     side: const BorderSide(
//                                       color: AppColors.primaryGreen,
//                                       width: 1,
//                                     ),
//                                   ),
//                                 ),
//                                 onPressed: () => controller.setFieldType(type),
//                                 child: Text(type),
//                               ),
//                             ),
//                           );
//                         }).toList(),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),

//             const SizedBox(height: 16),

//             // ===== Time & Price Section =====
//             Card(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(16),
//                 child: Obx(
//                   () => Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         "Time & Date base Price",
//                         style: TextStyle(
//                           fontWeight: FontWeight.w500,
//                           color: AppColors.primaryBlack,
//                           fontSize: 16,
//                         ),
//                       ),
//                       const SizedBox(height: 16),
//                       Row(
//                         children: [
//                           Expanded(
//                             child: _buildTimeRow(
//                               context,
//                               "Start Time",
//                               controller.startTime.value,
//                               () => controller.pickStartTime(context),
//                             ),
//                           ),
//                           const SizedBox(width: 16),
//                           Expanded(
//                             child: _buildTimeRow(
//                               context,
//                               "End Time",
//                               controller.endTime.value,
//                               () => controller.pickEndTime(context),
//                             ),
//                           ),
//                         ],
//                       ),

//                       CustomTextField(
//                         label: "Price per Hour (\$) ",
//                         controller: controller.priceController,
//                         keyboardType: TextInputType.number,
//                         isRequired: true,
//                       ),
//                       const Text(
//                         "Date",
//                         style: TextStyle(
//                           fontWeight: FontWeight.w400,
//                           fontSize: 14,
//                           color: AppColors.primaryBlack,
//                         ),
//                       ),
//                       const SizedBox(height: 8),
//                       InkWell(
//                         onTap: () => controller.pickDate(context),
//                         child: Container(
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 12,
//                             vertical: 14,
//                           ),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             border: Border.all(color: Colors.grey.shade400),
//                           ),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               // 👇 Left side: icon + hint/date text
//                               Row(
//                                 children: [
//                                   const Icon(
//                                     Icons.calendar_today_outlined,
//                                     size: 18,
//                                     color: Colors.grey,
//                                   ),
//                                   const SizedBox(width: 8),
//                                   Text(
//                                     DateFormat(
//                                       'MMMM d, yyyy',
//                                     ).format(controller.selectedDate.value),
//                                     style: const TextStyle(color: Colors.black),
//                                   ),
//                                 ],
//                               ),

//                               // 👇 Optional: dropdown indicator or arrow (can remove if not needed)
//                               const Icon(
//                                 Icons.arrow_drop_down,
//                                 color: Colors.grey,
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 16),
//                       const Divider(
//                         color: AppColors.primaryGreen,
//                         thickness: 2,
//                       ),
//                       const SizedBox(height: 16),

//                       Row(
//                         children: [
//                           Expanded(
//                             child: _buildTimeRow(
//                               context,
//                               "Start Time",
//                               controller.startTime.value,
//                               () => controller.pickStartTime(context),
//                             ),
//                           ),
//                           const SizedBox(width: 16),
//                           Expanded(
//                             child: _buildTimeRow(
//                               context,
//                               "End Time",
//                               controller.endTime.value,
//                               () => controller.pickEndTime(context),
//                             ),
//                           ),
//                         ],
//                       ),
//                       CustomTextField(
//                         label: "Price per Hour (\$) ",
//                         hintText: "80",
//                         controller: controller.priceController,
//                         keyboardType: TextInputType.number,
//                         isRequired: true,
//                       ),
//                       const Text(
//                         "Date",
//                         style: TextStyle(
//                           fontWeight: FontWeight.w400,
//                           color: AppColors.primaryBlack,
//                           fontSize: 14,
//                         ),
//                       ),
//                       const SizedBox(height: 8),
//                       InkWell(
//                         onTap: () => controller.pickDate(context),
//                         child: Container(
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 12,
//                             vertical: 14,
//                           ),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             border: Border.all(color: Colors.grey.shade400),
//                           ),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               // 👇 Left side: icon + hint/date text
//                               Row(
//                                 children: [
//                                   const Icon(
//                                     Icons.calendar_today_outlined,
//                                     size: 18,
//                                     color: Colors.grey,
//                                   ),
//                                   const SizedBox(width: 8),
//                                   Text(
//                                     DateFormat(
//                                       'MMMM d, yyyy',
//                                     ).format(controller.selectedDate.value),
//                                     style: const TextStyle(color: Colors.black),
//                                   ),
//                                 ],
//                               ),

//                               // 👇 Optional: dropdown indicator or arrow (can remove if not needed)
//                               const Icon(
//                                 Icons.arrow_drop_down,
//                                 color: Colors.grey,
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 16),
//                       SizedBox(
//                         width: double.infinity,
//                         child: ElevatedButton.icon(
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: AppColors.primaryGreen,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             padding: const EdgeInsets.symmetric(vertical: 14),
//                           ),
//                           icon: const Icon(Icons.add, color: Colors.white),
//                           label: const Text(
//                             "Add More",
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           onPressed: controller.addMoreSlot,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),

//             const SizedBox(height: 20),

//             // ===== Add More Button =====
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildTimeRow(
//     BuildContext context,
//     String label,
//     TimeOfDay time,
//     VoidCallback onTap,
//   ) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: const TextStyle(
//             fontWeight: FontWeight.w400,
//             color: AppColors.primaryBlack,
//             fontSize: 14,
//           ),
//         ),
//         const SizedBox(height: 6),
//         InkWell(
//           onTap: onTap,
//           child: Container(
//             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               border: Border.all(color: Colors.grey.shade400),
//             ),
//             child: Row(
//               children: [
//                 const Icon(Icons.access_time, size: 18),
//                 const SizedBox(width: 8),
//                 Text(
//                   time.format(context),
//                   style: const TextStyle(fontSize: 15),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         const SizedBox(height: 12),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../core/theme/app_colors.dart';
import '../controllers/add_field_controller.dart';
import '../widget/custom_text_field.dart';

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
                CircleAvatar(radius: 16),
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
                Wrap(
                  spacing: 20,
                  runSpacing: 10,
                  children: amenities.map((item) {
                    return SizedBox(
                      width: 150,

                      child: Obx(
                        () => CheckboxListTile(
                          title: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
                              color: AppColors.subText,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          value: controller.selectedAmenities.contains(item),
                          onChanged: (value) {
                            controller.toggleAmenity(item, value ?? false);
                          },
                          controlAffinity: ListTileControlAffinity.leading,
                          contentPadding: EdgeInsets.zero,
                          dense: true,
                        ),
                      ),
                    );
                  }).toList(),
                ),
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

                // 👇 customize colors
                activeColor: AppColors.subText, // the box color when checked
                // checkColor: Colors.bac, // the tick color
                tileColor: Colors.transparent, // optional background color
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
