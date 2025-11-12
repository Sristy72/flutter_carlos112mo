import 'package:get/get.dart';
import '../../data/model/booking_model.dart';


class BookingController extends GetxController {
  var upcomingBookings = <Booking>[].obs;
  var pastBookings = <Booking>[].obs;
  var selectedTab = 0.obs; // 0: Upcoming, 1: Past

  @override
  void onInit() {
    super.onInit();
    fetchBookings();
  }

  void fetchBookings() {
    // For now, dummy data. Later, integrate API
    upcomingBookings.value = [
      Booking(
        teamName: "Star Club Team",
        date: DateTime(2025, 9, 17),
        time: "12:00 - 13:00",
        playerFormat: "11v11",
        totalAmount: 120,
        status: "Pending",
      ),
      Booking(
        teamName: "Medona Football Club",
        date: DateTime(2025, 9, 17),
        time: "12:00 - 13:00",
        playerFormat: "11v11",
        totalAmount: 120,
        status: "Confirmed",
      ),
    ];

    pastBookings.value = [
      Booking(
        teamName: "Old Club Team",
        date: DateTime(2025, 8, 10),
        time: "10:00 - 11:00",
        playerFormat: "7v7",
        totalAmount: 80,
        status: "Confirmed",
      ),
    ];
  }

  void switchTab(int index) {
    selectedTab.value = index;
  }
}
