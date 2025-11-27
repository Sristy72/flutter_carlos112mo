import 'package:flutter/material.dart';
import 'package:flutter_carlos112mo/core/utils/debug_print.dart';
import 'package:flutter_carlos112mo/features/Owner/presentation/controllers/field_controller.dart';
import 'package:flutter_carlos112mo/features/player/presentation/screens/message_screen.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../profile/presentation/controllers/user_profie_controller.dart';
import '../../../team/presentation/controller/team_controller.dart';
import '../controller/field_controller.dart';
import '../controller/find_field_controller.dart';
import '../widgets/features_field_card.dart';
import '../widgets/filter_widget.dart';
import 'find_fields_screen.dart';

class PlayerFieldsScreen extends StatefulWidget {
  final teamId;
  const PlayerFieldsScreen({super.key, this.teamId});

  @override
  State<PlayerFieldsScreen> createState() => _PlayerFieldsScreenState();
}

class _PlayerFieldsScreenState extends State<PlayerFieldsScreen> {
  final FieldPlayerController controller = Get.put(
    FieldPlayerController(Get.find()),
  );
  final FindFieldController findcontroller = Get.find<FindFieldController>();
  final TeamController teamController = Get.find<TeamController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchField();
    }); // Fetch API
  }

  @override
  Widget build(BuildContext context) {
    final UserProfileController userProfileController =
        Get.find<UserProfileController>();
    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'Arequipa, Peru',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(width: 8),
                  Image(
                    height: 18,
                    width: 18,
                    image: AssetImage("assets/images/location_icon.png"),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    userProfileController.userProfileModel?.name ?? '',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(width: 8),
                  CircleAvatar(
                    backgroundColor: Colors.white70,
                    radius: 17,
                    foregroundImage:
                        (userProfileController.userProfileModel?.avatar?.url !=
                                null &&
                            userProfileController
                                .userProfileModel!
                                .avatar!
                                .url!
                                .isNotEmpty)
                        ? NetworkImage(
                            userProfileController
                                .userProfileModel!
                                .avatar!
                                .url!,
                          )
                        : null,
                    child: Icon(Icons.person),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

      body: Stack(
        children: [
          Obx(() {
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
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
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
                            controller.searchQuery(value);
                          },
                          decoration: InputDecoration(
                            hintText: "Search by name or location",
                            hintStyle: TextStyle(
                              color: AppColors.containerGrey,
                            ),
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
                            builder: (_) =>
                                FilterDialog(controller: controller),
                          );
                        },
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/images/funnelIcon.png",
                              height: 18,
                            ),

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
                  const Expanded(
                    child: Center(child: CircularProgressIndicator()),
                  )
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
                                    imagePath: field.images?.isNotEmpty == true
                                        ? field.images!.first.url ?? ''
                                        : "",
                                    title: field.fieldName ?? "Unknown Field",
                                    details:
                                        '${field.fieldType ?? "N/A"} • ${field.location?.address ?? "No address"}',
                                    price: field.pricePerHour != null
                                        ? '\$${field.pricePerHour!.toStringAsFixed(0)}/hr'
                                        : (field.basePricePerHour != null
                                              ? '\$${field.basePricePerHour!.toStringAsFixed(0)}/hr'
                                              : 'Price TBD'),
                                    rating: field.rating?.average ?? 0.0,
                                    reviews: field.rating?.count ?? 0,
                                    tags: [
                                      if (field.servicesAmenities?.showers ==
                                          true)
                                        "showers",
                                      if (field.servicesAmenities?.lights ==
                                          true)
                                        "lights",
                                      if (field.servicesAmenities?.parking ==
                                          true)
                                        "parking",
                                      if (field
                                              .servicesAmenities
                                              ?.changingRooms ==
                                          true)
                                        "changing rooms",
                                      if (field.servicesAmenities?.cafe == true)
                                        "cafe",
                                      if (field
                                              .servicesAmenities
                                              ?.equipmentRental ==
                                          true)
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
           Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton(
              backgroundColor: Colors.teal,
              onPressed: () {
                Get.to(
                  () =>
                      MessageScreen(teamId: teamController.currentTeamId.value, chatId: '',),
                );
              },
              child: Image.asset(
                "assets/images/messageIcon.png",
                height: 30,
                width: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
