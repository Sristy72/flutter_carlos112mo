import 'package:flutter/material.dart';
import 'package:flutter_carlos112mo/core/common/widgets/app_scaffold.dart';
import 'package:flutter_carlos112mo/core/theme/app_colors.dart';
import 'package:flutter_carlos112mo/core/theme/input_decoration_extensions.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controller/book_field_controller.dart';
import '../controller/find_field_controller.dart';

class BookFieldScreen extends StatelessWidget {
  const BookFieldScreen({
    super.key,
    required this.selectedDate,
    required this.selectedTime,
  });

  final DateTime selectedDate;
  final int selectedTime;

  @override
  Widget build(BuildContext context) {
    final FindFieldController findFieldController =
        Get.find<FindFieldController>();
    final BookFieldController bookFieldController =
        Get.find<BookFieldController>();
    final venue = findFieldController.venue.value;
    final List<int> hours = [1, 2, 3];
    String formattedDate = DateFormat('MMMM d, yyyy').format(selectedDate);
    String formatRange(int start, int duration) {
      final end = start + duration;
      return "${start.toString().padLeft(2, '0')}:00 - ${end.toString().padLeft(2, '0')}:00";
    }
    return AppScaffold(
      showDefaultAppBar: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Text('Book Field', style: TextStyle(fontSize: 18)),
          const SizedBox(height: 16),
          Card(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  Image.network(
                    venue?.images?[0].url ?? '',
                    height: 100,
                    width: 100,
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        venue?.fieldName ?? '',
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.group_outlined, size: 20),
                          const SizedBox(width: 8),
                          Text(
                            venue?.fieldType ?? '',
                            style: TextStyle(fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.location_pin, size: 20),
                          const SizedBox(width: 8),
                          Text(
                            venue?.location?.address ?? '',
                            style: TextStyle(fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            child: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Booking Details', style: TextStyle(fontSize: 16)),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Date'),
                      Spacer(),
                      TextButton(onPressed: () {}, child: Text('Change')),
                    ],
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    readOnly: true,
                    controller: TextEditingController(text: formattedDate),
                    decoration: context.primaryInputDecoration.copyWith(
                      prefixIcon: Icon(
                        Icons.calendar_today,
                        size: 20,
                        color: AppColors.borderGrey,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text('Time'),
                  const SizedBox(height: 8),
                  Obx(() {
                    String timeRange = formatRange(selectedTime, bookFieldController.selectedHour.value);

                    return TextFormField(
                      readOnly: true,
                      controller: TextEditingController(text: timeRange),
                      decoration: context.primaryInputDecoration.copyWith(
                        prefixIcon: Icon(
                          Icons.access_time,
                          size: 20,
                          color: AppColors.borderGrey,
                        ),
                      ),
                    );
                  }),

                  const SizedBox(height: 16),
                  Text('Duration'),
                  const SizedBox(height: 8),
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: hours.map((h) {
                        final isSelected =
                            bookFieldController.selectedHour.value == h;

                        return GestureDetector(
                          onTap: () => bookFieldController.selectHour(h),
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 6),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? Color(0xFFE6F5F3)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: isSelected
                                    ? Color(0xFF00917B)
                                    : Colors.grey.shade400,
                              ),
                            ),
                            child: Text(
                              "$h hour${h > 1 ? 's' : ''}",
                              style: TextStyle(
                                color: isSelected
                                    ? Color(0xFF00917B)
                                    : Colors.grey.shade700,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),
          Card(
            child: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Price Summary', style: TextStyle(fontSize: 16)),
                  const SizedBox(height: 16),
                  Row(
                    children: [Text('\$120 X 1 hour'), Spacer(), Text('\$120')],
                  ),
                  Divider(color: AppColors.borderGrey),
                  Row(children: [Text('Total'), Spacer(), Text('\$120')]),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              elevation: 0,
              minimumSize: Size(double.infinity, 48),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: Text('Proceed Payment'),
          ),
        ],
      ),
    );
  }
}
