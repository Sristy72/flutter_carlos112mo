import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../features/Owner/presentation/controllers/bottom_nav_controller.dart';

class CustomBottomNavBar extends StatelessWidget {
  final Function(int)? onTap;

  const CustomBottomNavBar({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BottomNavController());

    return Obx(
      () => BottomNavigationBar(
        currentIndex: controller.selectedIndex.value,
        onTap: (index) {
          controller.changeTab(index);
          if (onTap != null) onTap!(index);
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        elevation: 10,
        showUnselectedLabels: true,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        items: [
          _buildNavItem(
            label: "Home",
            iconPath: "assets/images/home.png",
            isActive: controller.selectedIndex.value == 0,
          ),
          _buildNavItem(
            label: "Dashboard",
            iconPath: "assets/images/dashboard.png",
            isActive: controller.selectedIndex.value == 1,
          ),
          _buildNavItem(
            label: "My Fields",
            iconPath: "assets/images/calendar.png",
            isActive: controller.selectedIndex.value == 2,
          ),
          _buildNavItem(
            label: "Profile",
            iconPath: "assets/images/Icon.png",
            isActive: controller.selectedIndex.value == 3,
          ),
        ],
      ),
    );
  }

  /// 🧱 Custom bottom nav item with dynamic tint
  BottomNavigationBarItem _buildNavItem({
    required String label,
    required String iconPath,
    required bool isActive,
  }) {
    return BottomNavigationBarItem(
      icon: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            iconPath,
            height: 26,
            width: 26,
            color: isActive ? Colors.teal : Colors.grey, // ✅ icon tint color
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: isActive ? Colors.teal : Colors.grey, // ✅ label color
            ),
          ),
        ],
      ),
      label: "", // hide Flutter's default label (we use custom text)
    );
  }
}
