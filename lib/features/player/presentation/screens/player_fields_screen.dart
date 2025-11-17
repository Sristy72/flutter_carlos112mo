import 'package:flutter/material.dart';
import 'package:flutter_carlos112mo/core/utils/debug_print.dart';
import 'package:flutter_carlos112mo/features/Owner/presentation/controllers/field_controller.dart';
import 'package:flutter_carlos112mo/features/player/presentation/screens/message_screen.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_colors.dart';
import '../controller/field_controller.dart';
import '../controller/find_field_controller.dart';
import '../widgets/features_field_card.dart';
import '../widgets/filter_widget.dart';
import 'find_fields_screen.dart';

class PlayerFieldsScreen extends StatefulWidget {
  const PlayerFieldsScreen({super.key});

  @override
  State<PlayerFieldsScreen> createState() => _PlayerFieldsScreenState();
}

class _PlayerFieldsScreenState extends State<PlayerFieldsScreen> {
  final FieldPlayerController controller = Get.put(
    FieldPlayerController(Get.find()),
  );
  final FindFieldController findcontroller = Get.find<FindFieldController>();

  @override
  void initState() {
    super.initState();
    controller.fetchField(); // Fetch API
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          children: [
            Text('Arequipa, Peru', style: TextStyle(fontSize: 18)),
            SizedBox(width: 8),
            Image(
              height: 15,
              width: 15,
              image: AssetImage("assets/images/location_icon.png"),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Row(
              children: const [
                Text(
                  "Mr. Raja",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: AppColors.primaryWhite,
                  ),
                ),
                SizedBox(width: 8),
                CircleAvatar(
                  radius: 18,
                  backgroundImage: AssetImage(
                    'assets/images/profile_sample.jpg',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      body: Obx(() {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔥 SEARCH & FILTER SECTION (Always visible)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Find Football Fields",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),

                  // Search Bar
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: AppColors.containerGrey,
                        width: 1.5,
                      ),
                    ),
                    child: TextField(
                      onChanged: (value) {
                        controller.setSearchQuery(value);
                      },
                      decoration: InputDecoration(
                        hintText: "Search by name or location",
                        hintStyle: TextStyle(color: AppColors.containerGrey),
                        // prefixIcon: Icon(Icons.search, color: AppColors.textFieldLightGrey),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Filter Row
                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (_) => FilterDialog(controller: controller),
                      );
                    },
                    child: Row(
                      children: [
                        Image.asset("assets/images/funnelIcon.png", height: 18),

                        SizedBox(width: 6),
                        Text(
                          "Filter",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textBlack,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // 🔥 LOADING
            if (controller.isLoading.value)
              const Expanded(child: Center(child: CircularProgressIndicator()))
            else ...[
              // Field Count Text
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                child: Text(
                  controller.filteredFields.isEmpty
                      ? "No fields found"
                      : "${controller.filteredFields.length} field${controller.filteredFields.length == 1 ? '' : 's'} found",
                  style: const TextStyle(fontSize: 14),
                ),
              ),

              // Field List
              Expanded(
                child: controller.filteredFields.isEmpty
                    ? const Center(child: Text("No fields found"))
                    : ListView.builder(
                        padding: const EdgeInsets.all(16),
                        itemCount: controller.filteredFields.length,
                        itemBuilder: (context, index) {
                          final field = controller.filteredFields[index];
                          DPrint.log("Player Fields: ${field.id}");

                          return Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: GestureDetector(
                              onTap: () {
                                // final findFieldController =
                                //     Get.find<FindFieldController>();

                                // if (field.id == null || field.id.isEmpty) {
                                //   print(
                                //     "❌ ERROR: Field ID is null or empty, navigation cancelled!",
                                //   );
                                //   return;
                                // }

                                // print(
                                //   "🐞 DEBUG: Navigating with ID: ${field.id}",
                                // );

                                // // findFieldController.selectedFieldId.value =
                                // //     field.id;

                                // print("🐞 Field clicked → ID = ${field.id}");
                                // Get.to(
                                //   () => FindFieldsScreen(id: field.id),
                                //   // must not be null
                                // );
                              },

                              child: FeaturedFieldCard(
                                id: field.id,
                                imagePath: field.images.isNotEmpty
                                    ? field.images.first.url
                                    : "",
                                title: field.fieldName,
                                details:
                                    '${field.fieldType} • ${field.location.address}',
                                price: '\$${field.pricePerHour}/hr',
                                rating: field.rating.average,
                                reviews: field.rating.count,
                                tags: [
                                  if (field.servicesAmenities.showers)
                                    "showers",
                                  if (field.servicesAmenities.lights) "lights",
                                  if (field.servicesAmenities.parking)
                                    "parking",
                                  if (field.servicesAmenities.changingRooms)
                                    "changing rooms",
                                  if (field.servicesAmenities.cafe) "cafe",
                                  if (field.servicesAmenities.equipmentRental)
                                    "equipment",
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          ],
        );
      }),
    );
  }
}
