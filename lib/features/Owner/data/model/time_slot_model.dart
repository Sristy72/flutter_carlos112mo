import 'package:flutter/material.dart';

class TimeSlot {
  TimeOfDay startTime;
  TimeOfDay endTime;
  int price;
  DateTime date;

  TimeSlot({
    required this.startTime,
    required this.endTime,
    required this.price,
    required this.date,
  });

  Map<String, dynamic> toJson() {
    return {
      'start_time': '${startTime.hour}:${startTime.minute}',
      'end_time': '${endTime.hour}:${endTime.minute}',
      'price': price,
      'date': date.toIso8601String().split('T').first,
    };
  }
}