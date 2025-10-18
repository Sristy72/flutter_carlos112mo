import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_colors.dart';
import '../widgets/features_field_card.dart';
import 'player_fields_screen.dart';

class PlayerHomeScreen extends StatelessWidget {
  const PlayerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: const [
                Icon(Icons.location_on_outlined, color: AppColors.primaryWhite),
                SizedBox(width: 6),
                Text(
                  "Arequipa, Peru",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  "Mr. Raja",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                ),
                const SizedBox(width: 8),
                const CircleAvatar(
                  radius: 18,
                  backgroundImage: AssetImage(
                    'assets/images/profile_sample.jpg',
                  ), // Replace with your asset
                ),
              ],
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              // Main Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Find Your Perfect\nFootball Field",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        height: 1.3,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Book fields, create teams, and organize matches all in one place.",
                      style: TextStyle(color: Colors.white70),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text("Find Fields"),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // How It Works
              const Text(
                "How It Works",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),

              GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _buildHowItWorksItem(
                    Icons.search,
                    "How It Works",
                    "Search and filter by location and amenities",
                  ),
                  _buildHowItWorksItem(
                    Icons.calendar_today,
                    "Book Online",
                    "Reserve time slots and pay securely",
                  ),
                  _buildHowItWorksItem(
                    Icons.group_add,
                    "Create Teams",
                    "Invite friends and organize matches",
                  ),
                  _buildHowItWorksItem(
                    Icons.place_outlined,
                    "Find Location",
                    "Get directions with integrated maps",
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // Featured Fields Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Featured Fields",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(const PlayerFieldsScreen());
                    },
                    child: Text(
                      "View All",
                      style: TextStyle(
                        color: Colors.teal,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Featured Fields List
              const FeaturedFieldCard(
                imagePath: 'assets/images/Fieldpic1.jpg',
                title: 'Green Valley Field',
                details: '5v5 • 123 Sports Lane, Football City',
                price: '\$120/hr',
                rating: 4.5,
                reviews: 18,
                tags: ['showers', 'lights', 'parking', '+2 more'],
              ),
              const SizedBox(height: 16),
              const FeaturedFieldCard(
                imagePath: 'assets/images/Fieldpic2.png',
                title: 'Urban Futsal Center',
                details: '11v11 • 45 Downtown Avenue City',
                price: '\$120/hr',
                rating: 4.8,
                reviews: 24,
                tags: ['showers', 'lights', 'parking', '+2 more'],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHowItWorksItem(IconData icon, String title, String subtitle) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.teal),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
          ),
          const SizedBox(height: 6),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }
}
