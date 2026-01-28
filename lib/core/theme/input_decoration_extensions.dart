import 'package:flutter/material.dart';
import 'package:flutx_core/flutx_core.dart';

import 'app_colors.dart';

extension InputDecorationExtensions on BuildContext {
  InputDecoration get primaryInputDecoration => InputDecoration(
    suffixIconColor: AppColors.textFieldLightGrey,
    fillColor: AppColors.primaryWhite,
    border: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.borderGrey),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.borderGrey),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.primaryGreen),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.logoutRed),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.logoutRed),
    ),
    hintStyle: TextStyle(
      color: AppColors.borderGrey,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    labelStyle: TextStyle(
      color: AppColors.primaryGreen,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    errorStyle: const TextStyle(
      color: AppColors.logoutRed,
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),
  );
}
//