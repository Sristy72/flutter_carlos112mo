import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class UpcomingEmptyState extends StatelessWidget {
  final VoidCallback onFindFields;

  const UpcomingEmptyState({super.key, required this.onFindFields});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.primaryWhite,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.4),
            blurRadius: 4,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        children: [
          // Icon(Icons.event_busy_outlined, size: 64),
          Image(
            height: 40,
            width: 40,
            image: AssetImage("assets/images/upcoming_icon.png"),
          ),
          SizedBox(height: 8),
          Text(
            'No reservations',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            "You don't have any upcoming reservations.",
            style: TextStyle(fontSize: 14),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 24),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(screenWidth / 3, 48),
              backgroundColor: AppColors.primaryGreen,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: onFindFields,
            child: Text(
              'Find Fields',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
