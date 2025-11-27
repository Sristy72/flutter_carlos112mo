import 'package:flutter/material.dart';
import 'package:flutter_carlos112mo/core/theme/app_colors.dart';
import 'package:flutter_carlos112mo/features/Owner/presentation/screens/add_field_screen.dart';
import 'package:flutter_carlos112mo/features/Owner/presentation/screens/owner_home_screen.dart';
import 'package:get/get.dart';

import '../../../../core/common/widgets/bottom_navigation_bar.dart';
import '../../../profile/presentation/controllers/user_profie_controller.dart';

class OwnerDashboardScreen extends StatelessWidget {
  const OwnerDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final UserProfileController userProfileController = Get.find<UserProfileController>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Obx(
              () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
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
                  Text(userProfileController.userProfileModel?.name ?? '', style: TextStyle(fontSize: 18)),
                  SizedBox(width: 8),
                  CircleAvatar(
                    backgroundColor: Colors.white70,
                    radius: 17,
                    foregroundImage: (userProfileController.userProfileModel?.avatar?.url != null &&
                        userProfileController.userProfileModel!.avatar!.url!.isNotEmpty)
                        ? NetworkImage(userProfileController.userProfileModel!.avatar!.url!)
                        : null,
                    child: Icon(Icons.person),
                  ),

                ],
              ),
            ],
          ),
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
                      Get.to(() => AddFieldScreen(isEdit: true, fieldId: '', model: true,));
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
    );
  }
}
