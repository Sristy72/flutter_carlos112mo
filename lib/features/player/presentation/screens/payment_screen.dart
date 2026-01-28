import 'package:flutter/material.dart';
import 'package:flutter_carlos112mo/core/common/widgets/app_scaffold.dart';
import 'package:flutter_carlos112mo/core/theme/app_colors.dart';
import 'package:flutter_carlos112mo/features/player/presentation/controller/book_field_controller.dart';
import 'package:flutter_carlos112mo/features/player/presentation/controller/find_field_controller.dart';
import 'package:get/get.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key, required this.date, required this.time});
  final String date;
  final String time;

  @override
  Widget build(BuildContext context) {
    final FindFieldController findFieldController =
        Get.find<FindFieldController>();
    Get.find<BookFieldController>();
    final BookFieldController bookFieldController =
        Get.find<BookFieldController>();
    final venue = findFieldController.venue.value;
    return AppScaffold(
      showDefaultAppBar: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Row(
              children: [
                Icon(Icons.arrow_back_ios, color: Colors.black),
                Text('Back', style: TextStyle(color: Colors.black)),
              ],
            ),
          ),
          Card(
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Payment',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 16),
                  Card(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 16,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Booking Summary',
                            style: TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
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
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                        ),
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
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.calendar_today_outlined, size: 20),
                                  const SizedBox(width: 8),
                                  Text('Date'),
                                ],
                              ),
                              const SizedBox(height: 6),
                              Row(
                                children: [
                                  const SizedBox(width: 28),
                                  Text(date),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),

                          Column(
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.access_time, size: 20),
                                  const SizedBox(width: 8),
                                  Text('Time'),
                                ],
                              ),
                              const SizedBox(height: 6,),
                              Row(
                                children: [
                                  const SizedBox(width: 28),
                                  Obx(
                                    () => Text(
                                      '$time (${bookFieldController.selectedHour.value} hours)',
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Divider(color: AppColors.borderGrey),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Text('Total Amount'),
                              Spacer(),
                              Text('\$120'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Card(
                    child: Container(
                      padding: EdgeInsets.all(12),
                      child: Row(
                        children: [
                          Text(
                            'Payment',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Spacer(),
                          Icon(Icons.radio_button_checked),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
