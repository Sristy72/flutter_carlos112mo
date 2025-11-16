import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../controller/field_controller.dart';

class FilterDialog extends StatefulWidget {
  final FieldPlayerController controller;

  const FilterDialog({required this.controller, super.key});

  @override
  State<FilterDialog> createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  String selectedFieldType = "";
  Map<String, bool> services = {
    "showers": false,
    "parking": false,
    "cafe": false,
    "lights": false,
    "changing rooms": false,
    "equipment rental": false,
  };

  double minPrice = 0;
  double maxPrice = 200;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      insetPadding: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // ---------- TITLE ----------
              Row(
                children: [
                  Image.asset("assets/images/filterIcon.png", height: 18),
                  // Icon(Icons.filter_alt_outlined, size: 20),
                  SizedBox(width: 6),
                  Text(
                    "Filter Options",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textBlack,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // ---------- FIELD TYPE ----------
              const Text(
                "Field Type",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textBlack,
                ),
              ),
              const SizedBox(height: 10),

              Row(
                children: [
                  _fieldTypeButton("5v5"),
                  const SizedBox(width: 8),
                  _fieldTypeButton("6v6"),
                  const SizedBox(width: 8),
                  _fieldTypeButton("11v11"),
                ],
              ),

              const SizedBox(height: 20),

              // ---------- SERVICES ----------
              const Text(
                "Services",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.primaryBlack,
                ),
              ),
              const SizedBox(height: 8),

              _servicesGrid(),

              const SizedBox(height: 20),

              // ---------- PRICE RANGE ----------
              const Text(
                "Price Range (per hour)",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.primaryBlack,
                ),
              ),

              const SizedBox(height: 8),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$${minPrice.toInt()}",
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "\$${maxPrice.toInt()}",
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                ],
              ),

              Slider(
                value: maxPrice,
                min: 10,
                max: 300, // maximum price
                activeColor: AppColors.primaryGreen,
                inactiveColor: AppColors.containerGrey.withOpacity(0.3),
                divisions: 300, // optional: steps
                label: "\$${maxPrice.toInt()}",
                onChanged: (value) {
                  setState(() {
                    maxPrice = value;
                  });
                },
              ),

              const SizedBox(height: 20),

              // ---------- ACTION BUTTONS ----------
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      "Cancel",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryGreen,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      widget.controller.applyFilter(
                        fieldType: selectedFieldType,
                        services: services,
                        minPrice: 0,
                        maxPrice: maxPrice,
                      );
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Apply",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ------------------- WIDGETS -------------------

  Widget _fieldTypeButton(String label) {
    bool selected = selectedFieldType == label;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() => selectedFieldType = label);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: selected ? AppColors.primaryGreen : Color(0xFFE5E7EB),
            borderRadius: BorderRadius.circular(8),
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(
              color: selected ? AppColors.primaryWhite : AppColors.primaryBlack,
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }

  Widget _servicesGrid() {
    final items = services.keys.toList();

    return Column(
      children: [
        for (int i = 0; i < items.length; i += 2)
          Row(
            children: [
              _serviceCheckbox(items[i]),
              const SizedBox(width: 12),
              if (i + 1 < items.length) _serviceCheckbox(items[i + 1]),
            ],
          ),
      ],
    );
  }

  Widget _serviceCheckbox(String service) {
    return Expanded(
      child: Row(
        children: [
          Checkbox(
            value: services[service],
            activeColor: AppColors.primaryGreen, // fill when checked
            side: const BorderSide(
              color: AppColors.subText, // Border color when UNCHECKED
              width: 2,
            ),
            onChanged: (v) {
              setState(() => services[service] = v ?? false);
            },
          ),

          Expanded(
            child: Text(
              service,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: AppColors.subText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
