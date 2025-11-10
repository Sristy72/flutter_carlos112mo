import 'package:flutter/material.dart';
import 'package:flutter_carlos112mo/core/theme/app_colors.dart';
import 'package:flutter_carlos112mo/features/Owner/presentation/screens/owner_home_screen.dart';
import 'package:get/get.dart';

import '../../../../core/common/widgets/bottom_navigation_bar.dart';

class OwnerDashboardScreen extends StatelessWidget {
  const OwnerDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF00897B), // Teal-green header
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

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Owner Dashboard',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryBlack,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // backgroundImage: AssetImage(
                  //   'assets/images/profile_photo.png',
                  // ),
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
                    onPressed: () {
                      // Handle add field action
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryGreen,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    icon: const Icon(Icons.add, color: Colors.white),
                    label: const Text(
                      'Add Your First Field',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
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
            Get.to(() => const OwnerDashboardScreen());
            // Get.toNamed('/dashboard');
          } else if (index == 2) {
            Get.toNamed('/myFields');
          } else if (index == 3) {
            Get.toNamed('/profile');
          }
        },
      ),

      // bottomNavigationBar: BottomNavigationBar(
      //   backgroundColor: Colors.white,
      //   selectedItemColor: const Color(0xFF00897B),
      //   unselectedItemColor: Colors.grey,
      //   currentIndex: 1, // Dashboard tab active
      //   onTap: (index) {
      //     // handle navigation
      //   },
      //   items: const [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home_outlined),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.dashboard),
      //       label: 'Dashboard',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person_outline),
      //       label: 'Profile',
      //     ),
      //   ],
      // ),
    );
  }
}
