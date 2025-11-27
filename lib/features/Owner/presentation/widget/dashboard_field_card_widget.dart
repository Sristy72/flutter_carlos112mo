import 'package:flutter/material.dart';
import 'package:flutter_carlos112mo/core/theme/app_colors.dart';
import 'package:flutter_carlos112mo/features/Owner/presentation/screens/add_field_screen.dart';
import 'package:get/get.dart';

class DashboardFieldCardWidget extends StatelessWidget {
  final String id;
  final String name;
  final String address;
  final String price;
  final double rating;
  final int reviews;
  final List<String> tags;
  final String imagePath;

  // Entire model optional (BEST WAY)
  final dynamic model;

  const DashboardFieldCardWidget({
    super.key,
    required this.id,
    required this.name,
    required this.address,
    required this.price,
    required this.rating,
    required this.reviews,
    required this.tags,
    required this.imagePath,
    this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ✅ Correct image loading
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.network(
              imagePath,
              height: 164,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        name,
                        style: const TextStyle(
                          color: AppColors.titleText,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Text(
                      "\$$price/hr",
                      style: const TextStyle(
                        color: AppColors.primaryGreen,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  address,
                  style: const TextStyle(
                    color: AppColors.subText,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: AppColors.reviewText,
                      size: 18,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      "$rating (${reviews.toString()} reviews)",
                      style: const TextStyle(fontSize: 13),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Wrap(
                  spacing: 6,
                  children: tags
                      .map(
                        (tag) => Chip(
                          label: Text(tag),
                          backgroundColor: AppColors.inputText,
                          labelStyle: const TextStyle(
                            color: AppColors.titleText,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          visualDensity: VisualDensity.compact,
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryGreen,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      Get.to(() => AddFieldScreen(
                        isEdit: true,
                        model: model, fieldId: id, // <-- send full field model
                      ));
                    },

                    child: const Text(
                      "Edit Field",
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.primaryWhite,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
