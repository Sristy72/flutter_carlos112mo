import 'package:flutter/material.dart';
import 'package:flutter_carlos112mo/features/player/presentation/screens/message_screen.dart';
import 'package:flutter_carlos112mo/features/profile/presentation/controllers/user_profie_controller.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../controller/find_field_controller.dart';
import '../widgets/payment_availability_widget.dart';

class FindFieldsScreen extends StatefulWidget {
  final String id;
  final teamId;
  const FindFieldsScreen({super.key, required this.id, this.teamId});

  @override
  State<FindFieldsScreen> createState() => _FindFieldsScreenState();
}

class _FindFieldsScreenState extends State<FindFieldsScreen> {
  final controller = Get.find<FindFieldController>();

  @override
  void initState() {
    super.initState();
    controller.selectedFieldId.value = widget.id;
    controller.fetchSingleField();
  }

  @override
  Widget build(BuildContext context) {
    final userProfileController = Get.find<UserProfileController>();

    return Scaffold(
      appBar: AppBar(
        title: Obx(() {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Text(
                    "Arequipa, Peru",
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

              /// User Profile
              Row(
                children: [
                  Text(
                    userProfileController.userProfileModel?.name ?? "",
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(width: 8),
                  CircleAvatar(
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
                    child: const Icon(Icons.person),
                  ),
                ],
              ),
            ],
          );
        }),
      ),

      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        final venue = controller.venue.value;
        if (venue == null) return const Center(child: Text("No data found"));

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ---------- Field Info Card ----------
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
                    // Title & Price
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            venue.fieldName ?? "Unnamed Field",
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
                            "\$${venue.basePricePerHour}/hr",
                            style: const TextStyle(
                              color: AppColors.primaryGreen,
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

                    // Rating
                    Row(
                      children: [
                        const Icon(Icons.star, size: 18, color: Colors.orange),
                        const SizedBox(width: 4),
                        Text(
                          "${venue.rating?.average ?? 0} (${venue.rating?.count ?? 0} reviews)",
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.orange,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    // Field Type
                    Row(
                      children: [
                        const Icon(Icons.person_2, size: 18),
                        const SizedBox(width: 4),
                        Text(
                          venue.fieldType ?? "Unknown Type",
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

                    // Amenities
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
                        if (venue.servicesAmenities?.showers == true)
                          _amenity(Icons.shower, "Showers"),
                        if (venue.servicesAmenities?.lights == true)
                          _amenity(Icons.light_mode, "Lights"),
                        if (venue.servicesAmenities?.parking == true)
                          _amenity(Icons.local_parking, "Parking"),
                        if (venue.servicesAmenities?.changingRooms == true)
                          _amenity(Icons.chair, "Changing Rooms"),
                        if (venue.servicesAmenities?.cafe == true)
                          _amenity(Icons.local_cafe, "Cafe"),
                        if (venue.servicesAmenities?.equipmentRental == true)
                          _amenity(Icons.sports_soccer, "Equipment Rental"),
                      ],
                    ),

                    const SizedBox(height: 18),

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
                          final img = venue.images?[index].url ?? "";

                          return ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              img,
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

                    const SizedBox(height: 20),

                    // Availability Check Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryGreen,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        icon: const Icon(
                          Icons.calendar_today,
                          color: Colors.white,
                        ),
                        label: const Text(
                          "Check Availability",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () => showDialog(
                          context: context,
                          builder: (_) => const PaymentAvailability(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Map Placeholder
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(child: Text("Map Placeholder")),
              ),
            ],
          ),
        );
      }),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        onPressed: () => Get.to(() => MessageScreen(teamId: widget.teamId, chatId: '',)),
        child: const Icon(Icons.chat_bubble_outline, color: Colors.white),
      ),
    );
  }
}

/// 🔥 Amenities builder widget
Widget _amenity(IconData icon, String text) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [Icon(icon, size: 18), const SizedBox(width: 4), Text(text)],
  );
}
