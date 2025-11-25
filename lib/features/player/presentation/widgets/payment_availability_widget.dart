import 'package:flutter/material.dart';
import 'package:flutter_carlos112mo/core/theme/app_colors.dart';
import 'package:flutter_carlos112mo/features/player/presentation/widgets/schedule_matching_dialog.dart';
import 'package:flutter_carlos112mo/features/team/presentation/controller/team_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PaymentAvailability extends StatefulWidget {
  final preselectedDate;
  final preselectedTime;


  const PaymentAvailability({
    super.key,
    this.preselectedDate,
    this.preselectedTime,
  });

  @override
  State<PaymentAvailability> createState() => _PaymentAvailabilityState();
}

class _PaymentAvailabilityState extends State<PaymentAvailability> {
  late List<DateTime> days;
  late DateTime selectedDate;
  int? selectedHour;
  final TeamController controller = Get.find<TeamController>();

  final List<int> times = [
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
  ];

  @override
  void initState() {
    super.initState();
    days = List.generate(7, (i) => DateTime.now().add(Duration(days: i)));
    selectedDate = widget.preselectedDate ?? days.first;
    selectedHour = widget.preselectedTime;
    WidgetsBinding.instance.addPostFrameCallback((_) {
    controller.fetchSingleTeam();
  });
  }

  @override
  Widget build(BuildContext context) {
    final dateFormatter = DateFormat('EEE'); // e.g., Mon, Tue, Wed

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(Icons.calendar_today, color: AppColors.primaryGreen),
                  Text(
                    "Select Date & Time",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(width: 24),
                ],
              ),
              const SizedBox(height: 12),

              // Days Row
              SizedBox(
                height: 60,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: days.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 6),
                  itemBuilder: (context, index) {
                    final day = days[index];
                    final isSelected = day == selectedDate;

                    return GestureDetector(
                      onTap: () => setState(() => selectedDate = day),
                      child: Container(
                        width: 60,
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColors.bgGreen
                              : Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: isSelected
                                ? AppColors.primaryGreen
                                : Colors.transparent,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              dateFormatter.format(day),
                              style: TextStyle(
                                color: isSelected
                                    ? AppColors.primaryGreen
                                    : Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              DateFormat('d').format(day),
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: isSelected
                                    ? AppColors.primaryGreen
                                    : Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),

              Text(
                "Available Times for ${DateFormat('MMMM d, yyyy').format(selectedDate)}",
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 12),

              // Time grid
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 2.4,
                ),
                itemCount: times.length,
                itemBuilder: (context, index) {
                  final hour = times[index];
                  final isSelected = selectedHour == hour;
                  return GestureDetector(
                    onTap: () => setState(() => selectedHour = hour),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: isSelected
                              ? AppColors.primaryGreen
                              : Colors.grey.shade300,
                        ),
                        color: isSelected ? AppColors.bgGreen : Colors.white,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "${hour.toString().padLeft(2, '0')}:00",
                        style: TextStyle(
                          color: isSelected
                              ? AppColors.primaryGreen
                              : Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),

              // Next button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: selectedHour == null
                      ? null
                      : () {
                          Navigator.pop(context); // CLOSE AvailabilityDialog

                          // showDialog(
                          //   context: context,
                          //   barrierDismissible: true,
                          //   builder: (_) => ScheduleMatchDialog(
                          //     selectedDate: selectedDate,
                          //     selectedHour: selectedHour!,
                          //   ),
                          // );

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "You selected: ${DateFormat('MMM d, yyyy').format(selectedDate)} at ${selectedHour}:00",
                              ),
                            ),
                          );
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryGreen,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: const Text(
                    "Next",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
