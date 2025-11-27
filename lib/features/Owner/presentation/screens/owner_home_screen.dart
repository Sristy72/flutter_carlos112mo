import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/common/widgets/bottom_navigation_bar.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../auth/presentation/controller/auth_controller.dart';
import '../../../player/presentation/controller/field_controller.dart'; // 👈 Player Controller
import '../../../profile/presentation/controllers/user_profie_controller.dart';
import '../../../profile/presentation/widgets/logout_button.dart';
import '../widget/feature_field_widget.dart';
import '../widget/info_card_widget.dart';
import 'dashboard_edit_field.dart';

class OwnerHomeScreen extends StatefulWidget {
  const OwnerHomeScreen({super.key});

  @override
  State<OwnerHomeScreen> createState() => _OwnerHomeScreenState();
}

class _OwnerHomeScreenState extends State<OwnerHomeScreen> {
  final controller = Get.find<FieldPlayerController>(); // 👈 Same controller like player

  final authcontroller = Get.find<AuthController>();
  final UserProfileController userProfileController = Get.find<UserProfileController>();

  @override
  void initState() {
    super.initState();
    controller.fetchField(); // 👈 API call
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Obx(
              () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Text('Arequipa, Peru', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
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
                  Text(userProfileController.userProfileModel?.name ?? '', style: const TextStyle(fontSize: 18)),
                  const SizedBox(width: 8),
                  CircleAvatar(
                    backgroundColor: Colors.white70,
                    radius: 17,
                    foregroundImage: (userProfileController.userProfileModel?.avatar?.url != null &&
                        userProfileController.userProfileModel!.avatar!.url!.isNotEmpty)
                        ? NetworkImage(userProfileController.userProfileModel!.avatar!.url!)
                        : null,
                    child: const Icon(Icons.person),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(height: 20),

            // LogoutButton(onLogout: () => authcontroller.logout()),

            // 🔰 Main Card
            Container(
              padding: const EdgeInsets.all(16),
              height: 254,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.primaryGreen,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Rent Your Perfect\nFootball Field",
                    style: TextStyle(
                      color: AppColors.primaryWhite,
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Rent fields, create fields, and organize matches all in one place.",
                    style: TextStyle(
                      color: AppColors.primaryWhite,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    height: 48,
                    width: 311,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryWhite,
                        foregroundColor: AppColors.primaryGreen,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        alignment: Alignment.centerLeft,
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Manage Your Fields",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            const Text("How It Works",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black87)),
            const SizedBox(height: 12),

            SizedBox(
              height: 186,
              child: Row(
                children: const [
                  Expanded(
                    child: InfoCardWidget(
                      imagePath: "assets/images/createField.png",
                      title: "Create Field",
                      subtitle: "Create and manage your own field with ease",
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: InfoCardWidget(
                      imagePath: "assets/images/rentField.png",
                      title: "Rent Field",
                      subtitle: "Rent out your field and manage bookings easily.",
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // 🔥 Featured Fields
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Featured Fields",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black87),
                ),
                TextButton(
                  onPressed: () {
                    Get.to(() => OwnerDashboardScreen());
                  },
                  child: const Text(
                    "View All",
                    style: TextStyle(color: Colors.teal, fontSize: 14),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            //API Connected List
            Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              if (controller.errorMessage.isNotEmpty) {
                return Text(controller.errorMessage.value);
              }

              if (controller.fields.value == null ||
                  controller.fields.value!.fields.isEmpty) {
                return const Text("No fields available");
              }

              return Column(
                children: controller.fields.value!.fields.map((field) {
                  return FieldCardWidget(
                    id: field.id,
                    imagePath: field.images?.isNotEmpty == true
                        ? field.images!.first.url ?? ''
                        : "",
                    name: field.fieldName ?? "Unknown Field",
                    address: '${field.fieldType ?? "N/A"} • ${field.location?.address ?? "No address"}',
                    price: field.pricePerHour != null
                        ? '\$${field.pricePerHour!.toStringAsFixed(0)}/hr'
                        : (field.basePricePerHour != null
                        ? '\$${field.basePricePerHour!.toStringAsFixed(0)}/hr'
                        : 'Price TBD'),
                    rating: field.rating?.average ?? 0.0,
                    reviews: field.rating?.count ?? 0,
                    tags: [
                      if (field.servicesAmenities?.showers == true)
                        "showers",
                      if (field.servicesAmenities?.lights == true)
                        "lights",
                      if (field.servicesAmenities?.parking == true)
                        "parking",
                      if (field.servicesAmenities?.changingRooms == true)
                        "changing rooms",
                      if (field.servicesAmenities?.cafe == true) "cafe",
                      if (field.servicesAmenities?.equipmentRental ==
                          true)
                        "equipment",
                    ],
                  );
                }).toList(),
              );
            }),
          ]),
        ),
      ),
    );
  }
}
