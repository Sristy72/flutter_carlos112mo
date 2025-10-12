import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class BookingsTabSelector extends StatelessWidget {
  final bool isUpcomingSelected;
  final ValueChanged<bool> onChanged;

  const BookingsTabSelector({
    super.key,
    required this.isUpcomingSelected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => onChanged(true),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: isUpcomingSelected
                          ? AppColors.primaryGreen
                          : AppColors.textFieldLightGrey,
                      width: 2,
                    ),
                  ),
                ),
                child: Text(
                  'Upcoming',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: isUpcomingSelected
                        ? AppColors.primaryGreen
                        : AppColors.textFieldLightGrey,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => onChanged(false),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: !isUpcomingSelected
                          ? AppColors.primaryGreen
                          : AppColors.textFieldLightGrey,
                      width: 2,
                    ),
                  ),
                ),
                child: Text(
                  'Past',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: !isUpcomingSelected
                        ? AppColors.primaryGreen
                        : AppColors.textFieldLightGrey,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
