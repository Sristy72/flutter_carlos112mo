import 'package:flutter/material.dart';
import 'package:flutter_carlos112mo/features/profile/presentation/controllers/user_profie_controller.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../player/presentation/controller/find_field_controller.dart';
import '../../../player/presentation/widgets/availability_dialog.dart';

class FieldDetailsScreen extends StatefulWidget {
  final String id;
  const FieldDetailsScreen({super.key, required this.id});

  @override
  State<FieldDetailsScreen> createState() => _FieldDetailsScreenState();
}

class _FieldDetailsScreenState extends State<FieldDetailsScreen> {
  // late FindFieldController controller;
  final controller = Get.find<FindFieldController>();
  // late String fieldId;

  @override
  void initState() {
    super.initState();
    print("🐞 FindFieldsScreen → widget.fieldId = ${widget.id}");
    controller.selectedFieldId.value = widget.id;
    controller.fetchSingleField();
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
                  Text(
                    'Arequipa, Peru',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(width: 8),
                  Image(
                    height: 18,
                    width: 18,
                    image: AssetImage("assets/images/location_icon.png"),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    userProfileController.userProfileModel?.name ?? '',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(width: 8),
                  CircleAvatar(
                    backgroundColor: Colors.white70,
                    radius: 17,
                    foregroundImage:
                        (userProfileController.userProfileModel?.avatar?.url !=
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
                    child: Icon(Icons.person),
                  ),
                ],
              ),
            ],
          ),
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
        final mapCenter = LatLng(
          // 23.7104, 90.4074
          venue.location?.coordinates?.latitude ?? 0.0,
          venue.location?.coordinates?.longitude ?? 0.0,
        );
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
                            venue.location?.address ?? "Address not provided",
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
                        if (venue.servicesAmenities?.showers ?? false)
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(Icons.shower, size: 18),
                              SizedBox(width: 4),
                              Text("Showers"),
                            ],
                          ),
                        if (venue.servicesAmenities?.lights ?? false)
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(Icons.light_mode, size: 18),
                              SizedBox(width: 4),
                              Text("Lights"),
                            ],
                          ),
                        if (venue.servicesAmenities?.parking ?? false)
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(Icons.local_parking, size: 18),
                              SizedBox(width: 4),
                              Text("Parking"),
                            ],
                          ),
                        if (venue.servicesAmenities?.changingRooms ?? false)
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(Icons.chair, size: 18),
                              SizedBox(width: 4),
                              Text("Changing Rooms"),
                            ],
                          ),
                        if (venue.servicesAmenities?.cafe ?? false)
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(Icons.local_cafe, size: 18),
                              SizedBox(width: 4),
                              Text("Cafe"),
                            ],
                          ),
                        if (venue.servicesAmenities?.equipmentRental ?? false)
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
                        itemCount: venue.images?.length ?? 0,
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

                    // // Check Availability Button
                    // SizedBox(
                    //   width: double.infinity,
                    //   child: ElevatedButton.icon(
                    //     style: ElevatedButton.styleFrom(
                    //       backgroundColor: AppColors.primaryGreen,
                    //       shape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(10),
                    //       ),
                    //       padding: const EdgeInsets.symmetric(vertical: 14),
                    //     ),
                    //     icon: const Icon(
                    //       Icons.calendar_today,
                    //       color: Colors.white,
                    //     ),
                    //     label: const Text(
                    //       "Check Availability",
                    //       style: TextStyle(color: Colors.white),
                    //     ),
                    //     onPressed: () {
                    //       showDialog(
                    //         context: context,
                    //         builder: (_) => const AvailabilityDialog(teamId: '',),
                    //       );
                    //     },
                    //   ),
                    // ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Map placeholder
              Card(
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(color: Colors.grey.shade300),
                  child: FlutterMap(
                    options: MapOptions(
                      initialCenter: mapCenter,
                      initialZoom: 18,
                    ),
                    children: [
                      TileLayer(
                        urlTemplate:
                        "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                        userAgentPackageName: 'com.example.flutter_carlos112mo',
                      ),
                      MarkerLayer(
                        markers: [
                          Marker(
                            width: 80,
                            height: 80,
                            point: mapCenter,
                            child: Icon(
                              Icons.location_pin,
                              size: 40,
                              color: Colors.red.shade400,
                            ),
                          ),
                        ],
                      ),
                    ],
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
