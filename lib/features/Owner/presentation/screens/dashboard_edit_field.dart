import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../player/presentation/controller/field_controller.dart';
import '../../../profile/presentation/controllers/user_profie_controller.dart';
import '../widget/dashboard_field_card_widget.dart';
import 'add_field_screen.dart';
import 'client_booking_screen.dart';

class OwnerDashboardScreen extends StatefulWidget {
  const OwnerDashboardScreen({super.key});

  @override
  State<OwnerDashboardScreen> createState() => _OwnerDashboardScreenState();
}

class _OwnerDashboardScreenState extends State<OwnerDashboardScreen> {
  final FieldPlayerController fieldController = Get.find<FieldPlayerController>();
  late final UserProfileController userProfileController;

  @override
  void initState() {
    super.initState();
    userProfileController = Get.find<UserProfileController>();
    fieldController.fetchField(); // fetch fields from API
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: Obx(
              () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Text('Arequipa, Peru', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                  const SizedBox(width: 8),
                  Image(height: 18, width: 18, image: AssetImage("assets/images/location_icon.png")),
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
        child: Obx(() {
          // Loading state
          if (fieldController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          // Error state
          if (fieldController.errorMessage.isNotEmpty) {
            return Center(
              child: Text(fieldController.errorMessage.value, style: const TextStyle(color: Colors.red)),
            );
          }

          // No fields
          if (fieldController.filteredFields.isEmpty) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.grid_view, color: Colors.grey[500], size: 40),
                  const SizedBox(height: 12),
                  const Text(
                    'No fields yet',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryBlack,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    "You haven't added any fields to your account yet. Add your first field to start receiving bookings.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF969696),
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: () => Get.to(() => AddFieldScreen()),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryGreen,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    icon: const Icon(Icons.add, color: Colors.white),
                    label: const Text(
                      'Add Your First Field',
                      style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            );
          }

          // Fields exist
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Dashboard Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Owner Dashboard",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black87),
                    ),
                    ElevatedButton(
                      onPressed: () => Get.to(() => BookingPageScreen()),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryGreen,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        elevation: 0,
                      ),
                      child: const Text("Field Booking", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // Field List
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: fieldController.filteredFields.length,
                  itemBuilder: (context, index) {
                    final field = fieldController.filteredFields[index];
                    return DashboardFieldCardWidget(
                      name: field.fieldName,
                      address: field.location.address,
                      price: "\$${field.pricePerHour}/hr",
                      rating: field.rating.average,
                      reviews: field.rating.count,
                      tags: [
                        if (field.servicesAmenities.showers) "showers",
                        if (field.servicesAmenities.lights) "lights",
                        if (field.servicesAmenities.parking) "parking",
                        if (field.servicesAmenities.changingRooms) "changing rooms",
                        if (field.servicesAmenities.cafe) "cafe",
                        if (field.servicesAmenities.equipmentRental) "equipment",
                      ],
                      imagePath: field.images.isNotEmpty ? field.images.first.url : "",
                    );
                  },
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
