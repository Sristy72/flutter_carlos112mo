import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class OwnerAppBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTabSelected;

  const OwnerAppBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.textBlack.withValues(alpha: 0.2),
            blurRadius: 5,
            offset: const Offset(0, -1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem('assets/images/nav_home.png', 'Home', 0),
          _buildNavItem('assets/images/dashboard.png', 'Dashboard', 1),
          _buildNavItem('assets/images/calendar.png', 'Add Fields', 2),
          _buildNavItem('assets/images/nav_teams.png', 'Profile', 3),
       
        ],
      ),
    );
  }

  Widget _buildNavItem(String navImage, String label, int index) {
    final bool isSelected = index == currentIndex;

    return GestureDetector(
      onTap: () => onTabSelected(index),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final double containerWidth = constraints.maxHeight > 0
              ? constraints.maxHeight
              : 75.0;

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                width: containerWidth,
                duration: const Duration(milliseconds: 250),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.primaryGreen.withValues(alpha: 0.2)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image(
                  height: 24,
                  width: 24,
                  image: AssetImage(navImage),
                  color: isSelected
                      ? AppColors.primaryGreen
                      : AppColors.textGrey,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(
                  color: isSelected
                      ? AppColors.primaryGreen
                      : AppColors.textGrey,
                  fontSize: 12,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
