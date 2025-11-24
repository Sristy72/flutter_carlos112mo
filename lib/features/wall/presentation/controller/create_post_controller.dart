import 'package:flutter/material.dart';
import 'package:flutter_carlos112mo/core/base/base_controller.dart';
import 'package:get/get.dart';

class CreatePostController extends BaseController {
  RxString selectedDate = ''.obs;
  RxString selectedTime = ''.obs;
  RxBool isMatchInvitation = false.obs;

  Future<void> pickDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      selectedDate.value =
          '${picked.day.toString().padLeft(2, '0')}/${picked.month.toString().padLeft(2, '0')}/${picked.year}';
    }
  }

  Future<void> pickTime(BuildContext context) async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if(picked != null){
      final hour = picked.hour.toString().padLeft(2, '0');
      final minute = picked.minute.toString().padLeft(2, '0');
      final period = picked.period == DayPeriod.am ? "AM" : "PM";
      selectedTime.value = '$hour : $minute $period';
    }
  }
}
