import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/model/find_field_model.dart';

class FindFieldController extends GetxController {
  var venue = Rx<VenueModel?>(null);

  @override
  void onInit() {
    super.onInit();
    loadVenue();
  }

  void loadVenue() async {
    // Later you’ll replace this with an API call
    await Future.delayed(const Duration(milliseconds: 500));
    venue.value = VenueModel(
      title: "Community Sports Complex",
      address: "200 Community Way, Football City",
      rating: 4.5,
      reviewCount: 18,
      type: "11V11",
      description:
          "Multi-purpose sports facility with several football fields of different sizes.",
      pricePerHour: 120,
      amenities: [
        AmenityModel("Showers", Icons.shower),
        AmenityModel("Lights", Icons.light),
        AmenityModel("Parking", Icons.local_parking),
        AmenityModel("Changing room", Icons.meeting_room),
        AmenityModel("Equipment rental", Icons.sports),
      ],
      photos: 
      [
        // 'assets/images/Fieldpic1.jpg',
        // 'assets/images/Fieldpic2.jpg',
        // 'assets/images/Fieldpic1.jpg',
      ],
    );
  }

  void checkAvailability() {
    Get.snackbar("Availability", "Feature coming soon!");
  }
}
