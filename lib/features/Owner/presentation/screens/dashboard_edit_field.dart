import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/common/widgets/bottom_navigation_bar.dart';
import '../../../../core/theme/app_colors.dart';
import '../controllers/field_controller.dart';
import '../widget/dashboard_field_card_widget.dart';
import '../widget/feature_field_widget.dart';
import '../widget/info_card_widget.dart';
import 'add_field_screen.dart';
import 'client_booking_screen.dart';
import 'owner_dashboard.dart';
import 'owner_home_screen.dart';

class OwnerDashboardEditScreen extends StatelessWidget {
  const OwnerDashboardEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FieldController());

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.primaryGreen, // Teal-green header
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
              children: [
                const Text(
                  'Kejim bb',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 6),
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
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Featured Fields
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Owner Dashboard",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black87,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // 👉 Navigate to booking page or trigger booking action
                      Get.to(
                        () => BookingPageScreen(),
                      ); // update route as needed
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryGreen,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 8,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      "Field Booking",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              Obx(() {
                return ListView.builder(
                  physics:
                      NeverScrollableScrollPhysics(), // disable scrolling inside scroll
                  shrinkWrap: true, // take only required height
                  itemCount: controller.fields.length,
                  itemBuilder: (context, index) {
                    final field = controller.fields[index];
                    return DashboardFieldCardWidget(
                      name: field.name,
                      address: field.address,
                      price: field.price,
                      rating: field.rating,
                      reviews: field.reviews,
                      tags: field.tags,
                      imagePath: field.imagepath,
                    );
                  },
                );
              }),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: CustomBottomNavBar(
      //   onTap: (index) {
      //     // Optional navigation logic
      //     if (index == 0) {
      //       Get.to(() => const OwnerHomeScreen());

      //       // Get.toNamed('/home');
      //     } else if (index == 1) {
      //       Get.to(() => const OwnerDashboardEditScreen());
      //       // Get.toNamed('/dashboard');
      //     } else if (index == 2) {
      //       // Get.toNamed('/myFields');
      //       Get.to(() => AddFieldScreen());
      //     } else if (index == 3) {
      //       Get.toNamed('/profile');
      //     }
      //   },
      // ),
    );
  }
}
