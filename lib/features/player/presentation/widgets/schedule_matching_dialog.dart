import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_carlos112mo/core/theme/app_colors.dart';
import 'availability_dialog.dart';

class ScheduleMatchDialog extends StatefulWidget {
  final String teamId;
  final DateTime selectedDate;
  final int selectedHour;

  const ScheduleMatchDialog({
    super.key,
    required this.teamId,
    required this.selectedDate,
    required this.selectedHour,
  });

  @override
  State<ScheduleMatchDialog> createState() => _ScheduleMatchDialogState();
}

class _ScheduleMatchDialogState extends State<ScheduleMatchDialog> {
  String? selectedField;
  int selectedDuration = 1;

  List<String> fields = ["Field A", "Field B", "Field C"];

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxHeight: 600, // ⭐ prevents overflow & enables scroll
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Schedule Match",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF404040),
                  ),
                ),

                const SizedBox(height: 15),

                // Field
                const Text("Field",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF404040),
                        fontSize: 14)),
                const SizedBox(height: 6),

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade400),
                  ),
                  child: DropdownButton(
                    isExpanded: true,
                    underline: const SizedBox(),
                    hint: const Text("Select a field"),
                    value: selectedField,
                    items: fields.map((e) {
                      return DropdownMenuItem(value: e, child: Text(e));
                    }).toList(),
                    onChanged: (value) {
                      setState(() => selectedField = value);
                    },
                  ),
                ),

                const SizedBox(height: 20),

                // Booking Details Card
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey.shade100,
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Booking Details",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF404040)),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                              showDialog(
                                context: context,
                                builder: (_) => AvailabilityDialog(
                                  teamId: widget.teamId,
                                  preselectedDate: widget.selectedDate,
                                  preselectedTime: widget.selectedHour,
                                ),
                              );
                            },
                            child: const Text(
                              "Change",
                              style: TextStyle(
                                  color: AppColors.primaryGreen, fontSize: 14),
                            ),
                          )
                        ],
                      ),

                      const SizedBox(height: 15),

                      // Date
                      const Text("Date", style: TextStyle(fontSize: 14)),
                      const SizedBox(height: 6),

                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey.shade300),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.calendar_today, size: 18),
                            const SizedBox(width: 10),
                            Text(
                              DateFormat("MMMM d, yyyy")
                                  .format(widget.selectedDate),
                              style: const TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 14),

                      // Time
                      const Text("Time", style: TextStyle(fontSize: 14)),
                      const SizedBox(height: 6),

                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey.shade300),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.access_time, size: 18),
                            const SizedBox(width: 10),
                            Text(
                              "${widget.selectedHour}:00 - ${widget.selectedHour + selectedDuration}:00",
                              style: const TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 14),

                      // Duration
                      const Text("Duration",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500)),
                      const SizedBox(height: 10),

                      Row(
                        children: [
                          _durationButton(1),
                          const SizedBox(width: 8),
                          _durationButton(2),
                          const SizedBox(width: 8),
                          _durationButton(3),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Submit Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryGreen,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "✓  Schedule Match",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),

                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _durationButton(int hour) {
    final bool isSelected = selectedDuration == hour;

    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => selectedDuration = hour),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isSelected ? AppColors.primaryGreen : Colors.grey.shade300,
            ),
            color: isSelected ? AppColors.bgGreen : Colors.white,
          ),
          alignment: Alignment.center,
          child: Text(
            "$hour hour${hour > 1 ? 's' : ''}",
            style: TextStyle(
              color: isSelected ? AppColors.primaryGreen : Colors.black87,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
