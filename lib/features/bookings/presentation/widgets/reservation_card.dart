import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class ReservationCard extends StatelessWidget {
  final String title;
  final String date;
  final String time;
  final String address;
  final String amount;
  final String status;

  const ReservationCard({
    super.key,
    required this.title,
    required this.date,
    required this.time,
    required this.address,
    required this.amount,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.info_outline, size: 16),
                    SizedBox(width: 4),
                    Text(
                      status,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Image(
                height: 16,
                width: 16,
                color: AppColors.textGrey,
                image: AssetImage("assets/images/calender_icon.png"),
              ),
              SizedBox(width: 8),
              Text(date, style: TextStyle(fontSize: 14)),
            ],
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Image(
                height: 16,
                width: 16,
                color: AppColors.textGrey,
                image: AssetImage("assets/images/time_icon.png"),
              ),
              SizedBox(width: 8),
              Text(
                time,
                style: TextStyle(fontSize: 14, color: AppColors.textGrey),
              ),
            ],
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Image(
                height: 16,
                width: 16,
                color: AppColors.textGrey,
                image: AssetImage("assets/images/location_icon.png"),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  address,
                  style: TextStyle(fontSize: 14, color: AppColors.textGrey),
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Divider(thickness: 1, color: AppColors.textGrey),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Amount',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              Text(
                amount,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
