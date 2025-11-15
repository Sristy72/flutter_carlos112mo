import 'package:flutter/material.dart';
import 'package:flutter_carlos112mo/features/Owner/presentation/controllers/field_controller.dart';
import 'package:flutter_carlos112mo/features/player/presentation/screens/message_screen.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_colors.dart';
import '../controller/field_controller.dart';
import '../widgets/features_field_card.dart';

// class PlayerFieldsScreen extends StatelessWidget {
//   const PlayerFieldsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final FieldPlayerController controller = Get.find<FieldPlayerController>();
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         title: Row(
//           children: const [
//             Icon(Icons.location_on_outlined, color: AppColors.primaryWhite),
//             SizedBox(width: 6),
//             Text(
//               "Arequipa, Peru",
//               style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
//             ),
//           ],
//         ),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.only(right: 8.0),
//             child: Row(
//               children: const [
//                 Text(
//                   "Mr. Raja",
//                   style: TextStyle(
//                     fontWeight: FontWeight.w600,
//                     fontSize: 14,
//                     color: AppColors.primaryWhite,
//                   ),
//                 ),
//                 SizedBox(width: 8),
//                 CircleAvatar(
//                   radius: 18,
//                   backgroundImage: AssetImage(
//                     'assets/images/profile_sample.jpg',
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Header
//           Container(
//             padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text(
//                   "Find Football Fields",
//                   style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 16),

//                 // Search Bar
//                 Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(8),
//                     border: Border.all(
//                       color: AppColors.textFieldLightGrey,
//                       width: 1.5,
//                     ),
//                   ),
//                   child: TextField(
//                     decoration: InputDecoration(
//                       hintText: "Search by name or location",
//                       hintStyle: TextStyle(color: AppColors.textFieldLightGrey),
//                       prefixIcon: Icon(
//                         Icons.search,
//                         color: AppColors.textFieldLightGrey,
//                       ),
//                       border: InputBorder.none,
//                       contentPadding: const EdgeInsets.symmetric(
//                         horizontal: 16,
//                         vertical: 14,
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 12),

//                 // Filter Row
//                 Row(
//                   children: const [
//                     Icon(Icons.filter_list, size: 20),
//                     SizedBox(width: 6),
//                     Text(
//                       "Filter",
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),

//           // Fields Count
//           Padding(
//             padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
//             child: Text("4 fields found", style: TextStyle(fontSize: 14)),
//           ),

//           // Fields List
//           Expanded(
//             child: ListView(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               children: const [
//                 FeaturedFieldCard(
//                   imagePath: 'assets/images/Fieldpic1.jpg',
//                   title: 'Green Valley Field',
//                   details: '5v5 • 123 Sports Lane, Football City',
//                   price: '\$120/hr',
//                   rating: 4.5,
//                   reviews: 18,
//                   tags: ['showers', 'lights', 'parking', '+2 more'],
//                 ),
//                 SizedBox(height: 16),
//                 FeaturedFieldCard(
//                   imagePath: 'assets/images/Fieldpic2.png',
//                   title: 'Urban Futsal Center',
//                   details: '11v11 • 45 Downtown Avenue City',
//                   price: '\$120/hr',
//                   rating: 4.8,
//                   reviews: 24,
//                   tags: ['lights', 'changing rooms', 'equipment'],
//                 ),
//                 SizedBox(height: 16),
//                 FeaturedFieldCard(
//                   imagePath: 'assets/images/Fieldpic1.jpg',
//                   title: 'Green Valley Field',
//                   details: '5v5 • 123 Sports Lane, Football City',
//                   price: '\$120/hr',
//                   rating: 4.5,
//                   reviews: 18,
//                   tags: ['showers', 'lights', 'parking', '+2 more'],
//                 ),
//                 SizedBox(height: 16),
//                 FeaturedFieldCard(
//                   imagePath: 'assets/images/Fieldpic2.png',
//                   title: 'Urban Futsal Center',
//                   details: '11v11 • 45 Downtown Avenue City',
//                   price: '\$120/hr',
//                   rating: 4.8,
//                   reviews: 24,
//                   tags: ['lights', 'changing rooms', 'equipment'],
//                 ),
//                 SizedBox(height: 20),
//               ],
//             ),
//           ),
//         ],
//       ),

//       // Floating Action Button
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Theme.of(context).primaryColor,
//         onPressed: () {
//           Get.to(const MessageScreen());
//         },
//         child: const Icon(Icons.chat_bubble, color: Colors.white),
//       ),
//     );
//   }
// }

// class PlayerFieldsScreen extends StatefulWidget {
//   const PlayerFieldsScreen({super.key});

//   @override
//   State<PlayerFieldsScreen> createState() => _PlayerFieldsScreenState();
// }

// class _PlayerFieldsScreenState extends State<PlayerFieldsScreen> {
//   final FieldPlayerController controller = Get.put(
//     FieldPlayerController(Get.find()),
//   );

//   @override
//   void initState() {
//     super.initState();
//     controller.fetchField(); // 🔥 Fetch API here
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         title: Row(
//           children: const [
//             Icon(Icons.location_on_outlined, color: AppColors.primaryWhite),
//             SizedBox(width: 6),
//             Text(
//               "Arequipa, Peru",
//               style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
//             ),
//           ],
//         ),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.only(right: 8.0),
//             child: Row(
//               children: const [
//                 Text(
//                   "Mr. Raja",
//                   style: TextStyle(
//                     fontWeight: FontWeight.w600,
//                     fontSize: 14,
//                     color: AppColors.primaryWhite,
//                   ),
//                 ),
//                 SizedBox(width: 8),
//                 CircleAvatar(
//                   radius: 18,
//                   backgroundImage: AssetImage(
//                     'assets/images/profile_sample.jpg',
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//       body: Obx(() {
//         if (controller.isLoading.value) {
//           return const Center(child: CircularProgressIndicator());
//         }

//         if (controller.errorMessage.isNotEmpty) {
//           return Center(child: Text(controller.errorMessage.value));
//         }

//         // 🔥 FIXED
//         if (controller.fields.value == null ||
//             controller.fields.value!.fields.isEmpty) {
//           return const Center(child: Text("No fields found"));
//         }

//         // 🔥 FIXED
//         final fieldList = controller.fields.value!.fields;

//         return ListView.builder(
//           padding: const EdgeInsets.all(16),
//           itemCount: fieldList.length,
//           itemBuilder: (context, index) {
//             final field = fieldList[index];

//             return Padding(
//               padding: const EdgeInsets.only(bottom: 16),
//               child: FeaturedFieldCard(
//                 imagePath: field.images.isNotEmpty
//                     ? field.images.first.url
//                     : "",
//                 title: field.fieldName,
//                 details: '${field.fieldType} • ${field.location.address}',
//                 price: '\$${field.pricePerHour}/hr',
//                 rating: field.rating.average,
//                 reviews: field.rating.count,
//                 tags: [
//                   if (field.servicesAmenities.showers) "showers",
//                   if (field.servicesAmenities.lights) "lights",
//                   if (field.servicesAmenities.parking) "parking",
//                   if (field.servicesAmenities.changingRooms) "changing rooms",
//                   if (field.servicesAmenities.cafe) "cafe",
//                   if (field.servicesAmenities.equipmentRental) "equipment",
//                 ],
//               ),
//             );
//           },
//         );
//       }),
//     );
//   }
// }


class PlayerFieldsScreen extends StatefulWidget {
  const PlayerFieldsScreen({super.key});

  @override
  State<PlayerFieldsScreen> createState() => _PlayerFieldsScreenState();
}

class _PlayerFieldsScreenState extends State<PlayerFieldsScreen> {
  final FieldPlayerController controller = Get.put(FieldPlayerController(Get.find()));

  @override
  void initState() {
    super.initState();
    controller.fetchField(); // Fetch API
  }

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
                  backgroundImage: AssetImage('assets/images/profile_sample.jpg'),
                ),
              ],
            ),
          ),
        ],
      ),

      body: Obx(() {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // 🔥 SEARCH & FILTER SECTION (Always visible)
            Padding(
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
                        color: AppColors.containerGrey,
                        width: 1.5,
                      ),
                    ),
                    child: TextField(
                      onChanged: (value) {
                        controller.setSearchQuery(value);
                      },
                      decoration: InputDecoration(
                        hintText: "Search by name or location",
                        hintStyle: TextStyle(color: AppColors.containerGrey),
                        // prefixIcon: Icon(Icons.search, color: AppColors.textFieldLightGrey),
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

            // 🔥 LOADING
            if (controller.isLoading.value)
              const Expanded(
                child: Center(child: CircularProgressIndicator()),
              )

            else ...[
              // Field Count Text
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                child: Text(
                  controller.filteredFields.isEmpty
                      ? "No fields found"
                      : "${controller.filteredFields.length} field${controller.filteredFields.length == 1 ? '' : 's'} found",
                  style: const TextStyle(fontSize: 14),
                ),
              ),

              // Field List
              Expanded(
                child: controller.filteredFields.isEmpty
                    ? const Center(child: Text("No fields found"))
                    : ListView.builder(
                        padding: const EdgeInsets.all(16),
                        itemCount: controller.filteredFields.length,
                        itemBuilder: (context, index) {
                          final field = controller.filteredFields[index];

                          return Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: FeaturedFieldCard(
                              imagePath: field.images.isNotEmpty ? field.images.first.url : "",
                              title: field.fieldName,
                              details: '${field.fieldType} • ${field.location.address}',
                              price: '\$${field.pricePerHour}/hr',
                              rating: field.rating.average,
                              reviews: field.rating.count,
                              tags: [
                                if (field.servicesAmenities.showers) "showers",
                                if (field.servicesAmenities.lights) "lights",
                                if (field.servicesAmenities.parking) "parking",
                                if (field.servicesAmenities.changingRooms) "changing rooms",
                                if (field.servicesAmenities.cafe) "cafe",
                                if (field.servicesAmenities.equipmentRental) "equipment",
                              ],
                            ),
                          );
                        },
                      ),
              ),
            ],
          ],
        );
      }),
    );
  }
}

