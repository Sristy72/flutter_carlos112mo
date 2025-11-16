// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../../core/theme/app_colors.dart';
// import '../controller/find_field_controller.dart';
// import '../widgets/availability_dialog.dart';

// class FindFieldsScreen extends StatelessWidget {
//   const FindFieldsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.find<FindFieldController>();

//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Row(
//               children: const [
//                 Icon(Icons.location_on_outlined, color: AppColors.primaryWhite),
//                 SizedBox(width: 6),
//                 Text(
//                   "Arequipa, Peru",
//                   style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
//                 ),
//               ],
//             ),
//             Row(
//               children: [
//                 const Text(
//                   "Mr. Raja",
//                   style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
//                 ),
//                 const SizedBox(width: 8),
//                 const CircleAvatar(
//                   radius: 18,
//                   backgroundImage: AssetImage(
//                     'assets/images/profile_sample.jpg',
//                   ), // Replace with your asset
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//       body:
//       Obx(() {
//         final venue = controller.venue.value;
//         if (venue == null) {
//           return const Center(child: CircularProgressIndicator());
//         }

//         return SingleChildScrollView(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // ---------- Title & Price ----------
//               Container(
//                 margin: const EdgeInsets.symmetric(
//                   horizontal: 16,
//                   vertical: 12,
//                 ),
//                 padding: const EdgeInsets.all(16),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(16),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.5),
//                       blurRadius: 8,
//                       offset: const Offset(0, 4),
//                     ),
//                   ],
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // ---------- Title & Price ----------
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Expanded(
//                           child: Text(
//                             venue.title,
//                             style: const TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                         Container(
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 12,
//                             vertical: 6,
//                           ),
//                           decoration: BoxDecoration(
//                             color: Colors.green.shade100,
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                           child: Text(
//                             "\$${venue.pricePerHour}/hr",
//                             style: const TextStyle(
//                               color: Colors.green,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 8),

//                     // ---------- Address ----------
//                     Row(
//                       children: [
//                         const Icon(Icons.location_on_outlined, size: 18),
//                         const SizedBox(width: 6),
//                         Expanded(
//                           child: Text(
//                             venue.address,
//                             style: const TextStyle(
//                               fontSize: 14,
//                               color: AppColors.subText,
//                               fontWeight: FontWeight.w400,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 8),

//                     // ---------- Rating & Type ----------
//                     Row(
//                       children: [
//                         const Icon(Icons.star, size: 18, color: Colors.orange),
//                         const SizedBox(width: 4),
//                         Text("${venue.rating} (${venue.reviewCount} reviews)", style: const TextStyle(fontSize: 14,color: Colors.orange)),
//                       ],
//                     ),
//                     const SizedBox(height: 16),

//                     Row(
//                       children: [
//                         // Image.network(
//                         //   "assets/images/nav_teams.png" ,// or the matching amenity
//                         //   width: 22,
//                         //   height: 22,
//                         // ),

//                         const Icon(Icons.person_2_sharp, size: 18),
//                         const SizedBox(width: 4),
//                         Text(venue.type, style: const TextStyle(fontSize: 14,color: AppColors.subText)),
//                       ],
//                     ),
//                     const SizedBox(height: 12),

//                     // ---------- Description ----------
//                     Text(
//                       venue.description,
//                       style: const TextStyle(
//                         fontSize: 14,
//                         height: 1.4,
//                         color: AppColors.subText,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                     const SizedBox(height: 16),

//                     // ---------- Services & Amenities ----------
//                     const Text(
//                       "Services & Amenities",
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                     const SizedBox(height: 16),
//                     Wrap(
//                       spacing: 20,
//                       runSpacing: 10,
//                       children: venue.amenities.map((item) {
//                         return Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Image.asset(
//                               item.image,
//                               width: 22,
//                               height: 22,
//                               fit: BoxFit.contain,
//                             ),
//                             const SizedBox(width: 6),
//                             Text(
//                               item.name,
//                               style: const TextStyle(
//                                 fontSize: 14,
//                                 color: Color(0xFF969696),
//                                 fontWeight: FontWeight.w400,
//                               ),
//                             ),
//                           ],
//                         );
//                       }).toList(),
//                     ),
//                     const SizedBox(height: 16),

//                     // ---------- Photo Album ----------
//                     const Text(
//                       "Photo Album",
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                     const SizedBox(height: 8),
//                     SizedBox(
//                       height: 80,
//                       child: ListView.separated(
//                         scrollDirection: Axis.horizontal,
//                         itemCount: venue.photos.length,
//                         separatorBuilder: (_, __) => const SizedBox(width: 8),
//                         itemBuilder: (context, index) {
//                           return ClipRRect(
//                             borderRadius: BorderRadius.circular(8),
//                             child: Image.asset(
//                               venue.photos[index],
//                               width: 100,
//                               height: 80,
//                               fit: BoxFit.cover,
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                     const SizedBox(height: 16),

//                     // ---------- Check Availability Button ----------
//                     SizedBox(
//                       width: double.infinity,
//                       child: ElevatedButton.icon(
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: AppColors.primaryGreen,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           padding: const EdgeInsets.symmetric(vertical: 14),
//                         ),
//                         icon: const Icon(
//                           Icons.calendar_today,
//                           color: Colors.white,
//                         ),
//                         label: const Text(
//                           "Check Availability",
//                           style: TextStyle(color: Colors.white),
//                         ),
//                         onPressed: () {
//                           showDialog(
//                             context: context,
//                             builder: (_) => const AvailabilityDialog(),
//                           );
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               ),

//               const SizedBox(height: 16),

//               // ---------- Map Location ----------
//               Card(
//                 elevation: 2,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(12),
//                   // child: Image.asset(
//                   //   'assets/images/sample_map.png',
//                   //   height: 200,
//                   //   width: double.infinity,
//                   //   fit: BoxFit.cover,
//                   // ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       }),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../../domain/find_field_repo.dart';
import '../controller/find_field_controller.dart';
import '../widgets/availability_dialog.dart';

class FindFieldsScreen extends StatefulWidget {
  const FindFieldsScreen({super.key});

  @override
  State<FindFieldsScreen> createState() => _FindFieldsScreenState();
}

class _FindFieldsScreenState extends State<FindFieldsScreen> {
  // late FindFieldController controller;
  final controller = Get.find<FindFieldController>();
  late String fieldId;

  @override
  void initState() {
    super.initState();

    final id = Get.arguments?.toString();
    if (id != null && id.isNotEmpty) {
      print("🐞 DEBUG: Received field ID -> $id");
      controller.selectedFieldId.value = id;
      controller.fetchSingleField();
    } else {
      print("❌ ERROR: No ID passed via arguments!");
    }
  }

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
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        final venue = controller.venue.value;
        if (venue == null) {
          return const Center(child: Text("No data found"));
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ---------- Title & Price ----------
              Container(
                margin: const EdgeInsets.symmetric(vertical: 12),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title & Price Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            venue.fieldName ?? "Unnamed field",
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.green.shade100,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            "\$${venue.pricePerHour}/hr",
                            style: const TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),

                    // Address
                    Row(
                      children: [
                        const Icon(Icons.location_on_outlined, size: 18),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            venue.location.address ?? "Address not provided",
                            style: const TextStyle(
                              fontSize: 14,
                              color: AppColors.subText,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),

                    // Rating & Type
                    Row(
                      children: [
                        const Icon(Icons.star, size: 18, color: Colors.orange),
                        const SizedBox(width: 4),
                        Text(
                          "${venue.rating ?? 0} (${venue.rating ?? 0} reviews)",
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.orange,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    // Type
                    Row(
                      children: [
                        const Icon(Icons.person_2_sharp, size: 18),
                        const SizedBox(width: 4),
                        Text(
                          venue.fieldType ?? "Unknown type",
                          style: const TextStyle(
                            fontSize: 14,
                            color: AppColors.subText,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    // Description
                    Text(
                      venue.description ?? "No description available",
                      style: const TextStyle(
                        fontSize: 14,
                        height: 1.4,
                        color: AppColors.subText,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Services & Amenities
                    const Text(
                      "Services & Amenities",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Wrap(
                      spacing: 20,
                      runSpacing: 10,
                      children: [
                        if (venue.servicesAmenities.showers)
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(Icons.shower, size: 18),
                              SizedBox(width: 4),
                              Text("Showers"),
                            ],
                          ),
                        if (venue.servicesAmenities.lights)
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(Icons.light_mode, size: 18),
                              SizedBox(width: 4),
                              Text("Lights"),
                            ],
                          ),
                        if (venue.servicesAmenities.parking)
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(Icons.local_parking, size: 18),
                              SizedBox(width: 4),
                              Text("Parking"),
                            ],
                          ),
                        if (venue.servicesAmenities.changingRooms)
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(Icons.chair, size: 18),
                              SizedBox(width: 4),
                              Text("Changing Rooms"),
                            ],
                          ),
                        if (venue.servicesAmenities.cafe)
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(Icons.local_cafe, size: 18),
                              SizedBox(width: 4),
                              Text("Cafe"),
                            ],
                          ),
                        if (venue.servicesAmenities.equipmentRental)
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(Icons.sports_soccer, size: 18),
                              SizedBox(width: 4),
                              Text("Equipment Rental"),
                            ],
                          ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Photo Album
                    const Text(
                      "Photo Album",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 80,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: venue.images.length ?? 0,
                        separatorBuilder: (_, __) => const SizedBox(width: 8),
                        itemBuilder: (context, index) {
                          final imageUrl = venue.images?[index].url ?? "";

                          return ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              imageUrl,
                              width: 100,
                              height: 80,
                              fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) => Container(
                                width: 100,
                                height: 80,
                                color: Colors.grey.shade300,
                                child: const Icon(Icons.broken_image),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Check Availability Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryGreen,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        icon: const Icon(
                          Icons.calendar_today,
                          color: Colors.white,
                        ),
                        label: const Text(
                          "Check Availability",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (_) => const AvailabilityDialog(),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Map placeholder
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    height: 200,
                    color: Colors.grey.shade200,
                    child: const Center(child: Text("Map placeholder")),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
