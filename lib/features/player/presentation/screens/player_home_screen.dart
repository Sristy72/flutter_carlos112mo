// import 'package:flutter/material.dart';
// import 'package:flutter_carlos112mo/features/profile/presentation/screens/user_profile_screen.dart';
// import 'package:get/get.dart';

// import '../../../../core/theme/app_colors.dart';
// import '../../../profile/presentation/controllers/user_profie_controller.dart';
// import '../controller/field_controller.dart';
// import '../widgets/features_field_card.dart';
// import 'player_fields_screen.dart';

// class PlayerHomeScreen extends StatefulWidget {
//   const PlayerHomeScreen({super.key});

//   @override
//   State<PlayerHomeScreen> createState() => _PlayerHomeScreenState();
// }

// class _PlayerHomeScreenState extends State<PlayerHomeScreen> {
//   final controller = Get.find<FieldPlayerController>();
//   @override
//   void initState() {
//     super.initState();
//     controller.fetchField();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final UserProfileController userProfileController =
//         Get.find<UserProfileController>();
//     return Scaffold(
//       appBar: AppBar(
//         title: Obx(
//           () => Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Row(
//                 children: [
//                   Text(
//                     'Arequipa, Peru',
//                     style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
//                   ),
//                   SizedBox(width: 8),
//                   Image(
//                     height: 18,
//                     width: 18,
//                     image: AssetImage("assets/images/location_icon.png"),
//                   ),
//                 ],
//               ),

//               // 👉 Wrap the profile row inside GestureDetector
//               GestureDetector(
//                 onTap: () {
//                   Get.to(() => UserProfileScreen());
//                 },
//                 child: Row(
//                   children: [
//                     Text(
//                       userProfileController.userProfileModel?.name ?? '',
//                       style: TextStyle(fontSize: 18),
//                     ),
//                     SizedBox(width: 8),
//                     CircleAvatar(
//                       backgroundColor: Colors.white70,
//                       radius: 17,
//                       foregroundImage:
//                           (userProfileController
//                                       .userProfileModel
//                                       ?.avatar
//                                       ?.url !=
//                                   null &&
//                               userProfileController
//                                   .userProfileModel!
//                                   .avatar!
//                                   .url!
//                                   .isNotEmpty)
//                           ? NetworkImage(
//                               userProfileController
//                                   .userProfileModel!
//                                   .avatar!
//                                   .url!,
//                             )
//                           : null,
//                       child: Icon(Icons.person),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),

//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(height: 20),

//               // Main Card
//               Container(
//                 width: double.infinity,
//                 padding: const EdgeInsets.all(20),
//                 decoration: BoxDecoration(
//                   color: Theme.of(context).primaryColor,
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text(
//                       "Find Your Perfect\nFootball Field",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         height: 1.3,
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                     const Text(
//                       "Book fields, create teams, and organize matches all in one place.",
//                       style: TextStyle(color: Colors.white70),
//                     ),
//                     const SizedBox(height: 20),
//                     ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.white,
//                         foregroundColor: Theme.of(context).primaryColor,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                       ),
//                       onPressed: () {},
//                       child: const Text("Find Fields"),
//                     ),
//                   ],
//                 ),
//               ),

//               const SizedBox(height: 25),

//               // How It Works
//               const Text(
//                 "How It Works",
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 16),

//               GridView.count(
//                 crossAxisCount: 2,
//                 mainAxisSpacing: 12,
//                 crossAxisSpacing: 12,
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 children: [
//                   _buildHowItWorksItem(
//                     Icons.search,
//                     "How It Works",
//                     "Search and filter by location and amenities",
//                   ),
//                   _buildHowItWorksItem(
//                     Icons.calendar_today,
//                     "Book Online",
//                     "Reserve time slots and pay securely",
//                   ),
//                   _buildHowItWorksItem(
//                     Icons.group_add,
//                     "Create Teams",
//                     "Invite friends and organize matches",
//                   ),
//                   _buildHowItWorksItem(
//                     Icons.place_outlined,
//                     "Find Location",
//                     "Get directions with integrated maps",
//                   ),
//                 ],
//               ),

//               const SizedBox(height: 30),

//               // Featured Fields Header
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "Featured Fields",
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                   TextButton(
//                     onPressed: () {
//                       Get.to(const PlayerFieldsScreen());
//                     },
//                     child: Text(
//                       "View All",
//                       style: TextStyle(
//                         color: Colors.teal,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),

//               const SizedBox(height: 16),

//               // Featured Fields List
//               Obx(() {
//                 if (controller.isLoading.value) {
//                   return const Center(child: CircularProgressIndicator());
//                 }

//                 if (controller.errorMessage.isNotEmpty) {
//                   return Text(controller.errorMessage.value);
//                 }

//                 if (controller.fields.value == null ||
//                     controller.fields.value!.fields.isEmpty) {
//                   return const Text("No fields available");
//                 }

//                 return Column(
//                   children: controller.fields.value!.fields.map((field) {
//                     return FeaturedFieldCard(
//                       id: field.id,
//                       imagePath: field.images.isNotEmpty
//                           ? field.images.first.url
//                           : "",
//                       title: field.fieldName,
//                       details: "${field.fieldType} • ${field.location.address}",
//                       price: "\$${field.pricePerHour}/hr",
//                       rating: field.rating.average,
//                       reviews: field.rating.count,
//                       tags: [
//                         if (field.servicesAmenities.showers) "showers",
//                         if (field.servicesAmenities.lights) "lights",
//                         if (field.servicesAmenities.parking) "parking",
//                         if (field.servicesAmenities.changingRooms)
//                           "changing rooms",
//                         if (field.servicesAmenities.cafe) "cafe",
//                         if (field.servicesAmenities.equipmentRental)
//                           "equipment",
//                       ],
//                     );
//                   }).toList(),
//                 );
//               }),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildHowItWorksItem(IconData icon, String title, String subtitle) {
//     return Container(
//       padding: const EdgeInsets.all(14),
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.grey.shade300),
//         borderRadius: BorderRadius.circular(10),
//         color: Colors.white,
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(icon, color: Colors.teal),
//           const SizedBox(height: 10),
//           Text(
//             title,
//             style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
//           ),
//           const SizedBox(height: 6),
//           Text(
//             subtitle,
//             textAlign: TextAlign.center,
//             style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_carlos112mo/features/player/presentation/screens/message_screen.dart';
import 'package:flutter_carlos112mo/features/profile/presentation/screens/user_profile_screen.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../profile/presentation/controllers/user_profie_controller.dart';
import '../../../team/presentation/controller/team_controller.dart';
import '../controller/field_controller.dart';
import '../widgets/features_field_card.dart';
import 'player_fields_screen.dart';

class PlayerHomeScreen extends StatefulWidget {
  const PlayerHomeScreen({super.key});

  @override
  State<PlayerHomeScreen> createState() => _PlayerHomeScreenState();
}

class _PlayerHomeScreenState extends State<PlayerHomeScreen> {
  final controller = Get.find<FieldPlayerController>();
  final TeamController teamController = Get.find<TeamController>();


  @override
  void initState() {
    super.initState();
    controller.fetchField();
  }

  @override
  Widget build(BuildContext context) {
    final UserProfileController userProfileController =
        Get.find<UserProfileController>();

    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Text(
                    'Arequipa, Peru',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(width: 8),
                  const Image(
                    height: 18,
                    width: 18,
                    image: AssetImage("assets/images/location_icon.png"),
                  ),
                ],
              ),

              GestureDetector(
                onTap: () {
                  Get.to(() => UserProfileScreen());
                },
                child: Row(
                  children: [
                    Text(
                      userProfileController.userProfileModel?.name ?? '',
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(width: 8),
                    CircleAvatar(
                      backgroundColor: Colors.white70,
                      radius: 17,
                      foregroundImage:
                          (userProfileController
                                      .userProfileModel
                                      ?.avatar
                                      ?.url !=
                                  null &&
                              userProfileController
                                  .userProfileModel!
                                  .avatar!
                                  .url!
                                  .isNotEmpty)
                          ? NetworkImage(
                              userProfileController
                                  .userProfileModel!
                                  .avatar!
                                  .url!,
                            )
                          : null,
                      child: const Icon(Icons.person),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      // -----------------------
      // BODY + FLOATING CHAT
      // -----------------------
      body: Stack(
        children: [
          // Main Scrollable Content
          SafeArea(
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
                          onPressed: () {
                            Get.to(() => PlayerFieldsScreen());
                          },
                          child: const Text("Find Fields"),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),

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

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Featured Fields",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.to(const PlayerFieldsScreen());
                        },
                        child: const Text(
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

                  Obx(() {
                    if (controller.isLoading.value) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (controller.errorMessage.isNotEmpty) {
                      return Text(controller.errorMessage.value);
                    }

                    if (controller.fields.value == null ||
                        controller.fields.value!.fields.isEmpty) {
                      return const Text("No fields available");
                    }

                    return Column(
                      children: controller.fields.value!.fields.map((field) {
                        return FeaturedFieldCard(
                          id: field.id,
                          imagePath: field.images?.isNotEmpty == true
                              ? field.images!.first.url ?? ''
                              : "",
                          title: field.fieldName ?? "Unknown Field",
                          details:
                              '${field.fieldType ?? "N/A"} • ${field.location?.address ?? "No address"}',
                          price: field.pricePerHour != null
                              ? '\$${field.pricePerHour!.toStringAsFixed(0)}/hr'
                              : (field.basePricePerHour != null
                                    ? '\$${field.basePricePerHour!.toStringAsFixed(0)}/hr'
                                    : 'Price TBD'),
                          rating: field.rating?.average ?? 0.0,
                          reviews: field.rating?.count ?? 0,
                          tags: [
                            if (field.servicesAmenities?.showers == true)
                              "showers",
                            if (field.servicesAmenities?.lights == true)
                              "lights",
                            if (field.servicesAmenities?.parking == true)
                              "parking",
                            if (field.servicesAmenities?.changingRooms == true)
                              "changing rooms",
                            if (field.servicesAmenities?.cafe == true) "cafe",
                            if (field.servicesAmenities?.equipmentRental ==
                                true)
                              "equipment",
                          ],
                        );
                      }).toList(),
                    );
                  }),
                ],
              ),
            ),
          ),

          // --------------------------------------------------
          // Floating Chat Button at bottom-right
          // --------------------------------------------------
          Positioned(
            bottom: 20,
            right: 20,
            child: 
            FloatingActionButton(
              backgroundColor: Colors.teal,
              onPressed: () {
                Get.to(
                  () =>
                      MessageScreen(teamId: teamController.currentTeamId.value, chatId: '',),
                );
              },
              child: Image.asset(
                "assets/images/messageIcon.png",
                height: 30,
                width: 30,
              ),
            ),
          ),
        ],
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
