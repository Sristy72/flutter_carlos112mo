import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/common/widgets/bottom_navigation_bar.dart';
import '../../../../core/theme/app_colors.dart';
import '../controllers/field_controller.dart';
import '../widget/feature_field_widget.dart';
import '../widget/info_card_widget.dart';
import 'owner_dashboard.dart';

class OwnerHomeScreen extends StatelessWidget {
  const OwnerHomeScreen({super.key});

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
                const CircleAvatar(
                  radius: 16,
                  // backgroundImage: AssetImage(
                  //   'assets/images/profile_photo.png',
                  // ),
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
              // Header
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Row(
              //       children: const [
              //         SizedBox(width: 6),
              //         Text(
              //           "Arequipa, Peru",
              //           style: TextStyle(
              //             fontWeight: FontWeight.w600,
              //             fontSize: 16,
              //           ),
              //         ),
              //         Icon(Icons.location_on, color: Colors.teal),
              //       ],
              //     ),
              //     const CircleAvatar(
              //       // backgroundImage: NetworkImage(
              //       //   "https://randomuser.me/api/portraits/men/32.jpg",
              //       // ),
              //       radius: 18,
              //     ),
              //   ],
              // ),
              const SizedBox(height: 20),

              // Main card
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
                            color: AppColors.primaryGreen,
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

              // How It Works
              const Text(
                "How It Works",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 12),

              SizedBox(
                height: 186, // fixed height for the cards
                child: Row(
                  children: [
                    Expanded(
                      child: InfoCardWidget(
                        imagePath: "assets/images/createField.png",
                        title: "Create Field",
                        subtitle: "Create and manage your own field with ease",
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: InfoCardWidget(
                        imagePath: "assets/images/rentField.png",
                        title: "Rent Field",
                        subtitle:
                            "Rent out your field and manage bookings easily.",
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Featured Fields
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Featured Fields",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    "View All",
                    style: TextStyle(color: Colors.teal, fontSize: 14),
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
                    return FieldCardWidget(
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
      bottomNavigationBar: CustomBottomNavBar(
        onTap: (index) {
          // Optional navigation logic
          if (index == 0) {
            Get.to(() => const OwnerHomeScreen());
            
            // Get.toNamed('/home');
          } else if (index == 1) {
            Get.to(() => const OwnerDashboardScreen());
            // Get.toNamed('/dashboard');
          } else if (index == 2) {
            Get.toNamed('/myFields');
          } else if (index == 3) {
            Get.toNamed('/profile');
          }
        },
      ),
    );
  }
}
