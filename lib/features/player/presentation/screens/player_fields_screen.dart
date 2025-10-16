import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../widgets/features_field_card.dart';

class PlayerFieldsScreen extends StatelessWidget {
  const PlayerFieldsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          children: const [
            Icon(Icons.location_on_outlined, color: AppColors.primaryWhite),
            SizedBox(width: 6),
            Text(
              "Arequipa, Peru",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Row(
              children: const [
                Text(
                  "Mr. Raja",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: AppColors.primaryWhite,
                  ),
                ),
                SizedBox(width: 8),
                CircleAvatar(
                  radius: 18,
                  backgroundImage: AssetImage(
                    'assets/images/profile_sample.jpg',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Container(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Find Football Fields",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),

                // Search Bar
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: AppColors.textFieldLightGrey,
                      width: 1.5,
                    ),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search by name or location",
                      hintStyle: TextStyle(color: AppColors.textFieldLightGrey),
                      prefixIcon: Icon(
                        Icons.search,
                        color: AppColors.textFieldLightGrey,
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                // Filter Row
                Row(
                  children: const [
                    Icon(Icons.filter_list, size: 20),
                    SizedBox(width: 6),
                    Text(
                      "Filter",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Fields Count
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
            child: Text("4 fields found", style: TextStyle(fontSize: 14)),
          ),

          // Fields List
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: const [
                FeaturedFieldCard(
                  imagePath: 'assets/images/Fieldpic1.jpg',
                  title: 'Green Valley Field',
                  details: '5v5 • 123 Sports Lane, Football City',
                  price: '\$120/hr',
                  rating: 4.5,
                  reviews: 18,
                  tags: ['showers', 'lights', 'parking', '+2 more'],
                ),
                SizedBox(height: 16),
                FeaturedFieldCard(
                  imagePath: 'assets/images/Fieldpic2.png',
                  title: 'Urban Futsal Center',
                  details: '11v11 • 45 Downtown Avenue City',
                  price: '\$120/hr',
                  rating: 4.8,
                  reviews: 24,
                  tags: ['lights', 'changing rooms', 'equipment'],
                ),
                SizedBox(height: 16),
                FeaturedFieldCard(
                  imagePath: 'assets/images/Fieldpic1.jpg',
                  title: 'Green Valley Field',
                  details: '5v5 • 123 Sports Lane, Football City',
                  price: '\$120/hr',
                  rating: 4.5,
                  reviews: 18,
                  tags: ['showers', 'lights', 'parking', '+2 more'],
                ),
                SizedBox(height: 16),
                FeaturedFieldCard(
                  imagePath: 'assets/images/Fieldpic2.png',
                  title: 'Urban Futsal Center',
                  details: '11v11 • 45 Downtown Avenue City',
                  price: '\$120/hr',
                  rating: 4.8,
                  reviews: 24,
                  tags: ['lights', 'changing rooms', 'equipment'],
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),

      // Floating Action Button
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          // Handle chat or message action
        },
        child: const Icon(Icons.chat_bubble, color: Colors.white),
      ),
    );
  }
}
