import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../core/theme/app_colors.dart';
import '../../data/model/booking_model.dart';
import '../controllers/booking_controller.dart';

class BookingPageScreen extends StatelessWidget {
  final BookingController controller = Get.put(BookingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.primaryGreen,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: const [
                Icon(Icons.location_on_outlined, color: Colors.white, size: 18),
                SizedBox(width: 4),
                Text(
                  'Arequipa, Peru',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Row(
              children: const [
                Text(
                  'Kejim bb',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 6),
                CircleAvatar(
                  radius: 16,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, color: Colors.grey, size: 20),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔙 Back button row
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: GestureDetector(
              onTap: () => Get.back(),
              child: Row(
                children: const [
                  Icon(Icons.arrow_back, color: Colors.black),
                  SizedBox(width: 6),
                  Text(
                    "Back",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),

          // 🔖 Tabs
          _buildTabBar(),
          const SizedBox(height: 24),

          // 📋 Booking List
          Expanded(
            child: Obx(() {
              final bookings = controller.selectedTab.value == 0
                  ? controller.upcomingBookings
                  : controller.pastBookings;

              if (bookings.isEmpty) {
                return const Center(
                  child: Text(
                    "No bookings found",
                    style: TextStyle(color: Colors.grey),
                  ),
                );
              }

              return ListView.builder(
                itemCount: bookings.length,
                itemBuilder: (context, index) {
                  return _buildBookingCard(bookings[index]);
                },
              );
            }),
          ),
        ],
      ),
    );
  }

  // 📍 Tab bar section
  Widget _buildTabBar() {
    return Obx(() {
      return Container(
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => controller.switchTab(0),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: controller.selectedTab.value == 0
                            ? AppColors.primaryGreen
                            : Colors.grey.shade300,
                        width: 2,
                      ),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "Upcoming",
                      style: TextStyle(
                        fontWeight: controller.selectedTab.value == 0
                            ? FontWeight.w600
                            : FontWeight.w400,
                        color: controller.selectedTab.value == 0
                            ? AppColors.primaryGreen
                            : Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => controller.switchTab(1),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: controller.selectedTab.value == 1
                            ? AppColors.primaryGreen
                            : Colors.grey.shade300,
                        width: 2,
                      ),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "Past",
                      style: TextStyle(
                        fontWeight: controller.selectedTab.value == 1
                            ? FontWeight.w600
                            : FontWeight.w400,
                        color: controller.selectedTab.value == 1
                            ? AppColors.primaryGreen
                            : Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  // 🎟 Booking card (Figma look)
  Widget _buildBookingCard(Booking booking) {
    final bool isPending = booking.status == "Pending";

    Color badgeColor = isPending
        ? Colors.red.shade50
        : AppColors.bgGreen; // light bg
    Color borderColor = isPending
        ? Colors.red.shade400
        : AppColors.primaryGreen;
    Color textColor = borderColor;
    IconData statusIcon = isPending
        ? Icons.access_time
        : Icons.check_circle_outline;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🏷 Team name + status badge
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  booking.teamName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: badgeColor,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: borderColor),
                  ),
                  child: Row(
                    children: [
                      Icon(statusIcon, color: textColor, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        booking.status,
                        style: TextStyle(
                          color: textColor,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // 📅 Details rows
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                const SizedBox(width: 6),
                Text(
                  DateFormat('MMMM dd, yyyy').format(booking.date),
                  style: const TextStyle(color: Colors.black87),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                const Icon(Icons.access_time, size: 16, color: Colors.grey),
                const SizedBox(width: 6),
                Text(booking.time),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                const Icon(Icons.group, size: 16, color: Colors.grey),
                const SizedBox(width: 6),
                Text(booking.playerFormat),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(),
            // 💵 Total amount
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Total Amount",
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "\$${booking.totalAmount.toStringAsFixed(2)}",
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
