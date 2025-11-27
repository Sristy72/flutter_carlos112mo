import 'package:flutter/material.dart';
import 'package:flutter_carlos112mo/core/common/widgets/app_scaffold.dart';
import 'package:flutter_carlos112mo/core/theme/app_colors.dart';
import 'package:flutter_carlos112mo/core/theme/input_decoration_extensions.dart';
import 'package:get/get.dart';

import '../controller/find_field_controller.dart';

class BookFieldScreen extends StatelessWidget {
  const BookFieldScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FindFieldController findFieldController =
        Get.find<FindFieldController>();
    final venue = findFieldController.venue.value;
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
                    decoration: context.primaryInputDecoration.copyWith(
                      hintText: 'November 24, 2025',
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
                  TextFormField(
                    readOnly: true,
                    decoration: context.primaryInputDecoration.copyWith(
                      hintText: '12:00 - 13:00',
                      prefixIcon: Icon(
                        Icons.access_time,
                        size: 20,
                        color: AppColors.borderGrey,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text('Duration'),
                  const SizedBox(height: 8),
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
                  Row(children: [Text('\$120 X 1 hour'),
                  Spacer(),
                  Text('\$120')]),
                  Divider(color: AppColors.borderGrey,),
                  Row(children: [Text('Total'),
                  Spacer(),
                  Text('\$120')]),

                ],
              ),
            ),
          ),
          const SizedBox(height: 16,),
          ElevatedButton(onPressed: () {

          }, style: ElevatedButton.styleFrom(
            elevation: 0,
            minimumSize: Size(double.infinity, 48),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ), child: Text('Proceed Payment')),
        ],
      ),
    );
  }
}
