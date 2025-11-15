import 'package:flutter/material.dart';

import '../controller/field_controller.dart';

class FilterDialog extends StatefulWidget {
  final FieldPlayerController controller;
  const FilterDialog({required this.controller, super.key});

  @override
  State<FilterDialog> createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  // Filter selections
  String selectedFieldType = "";
  Map<String, bool> services = {
    "showers": false,
    "lights": false,
    "parking": false,
    "changingRooms": false,
    "cafe": false,
    "equipmentRental": false,
  };
  double minPrice = 120;
  double maxPrice = 200;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Filter Options"),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Field Type"),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: ["5v5", "6v6", "11v11"].map((type) {
                final isSelected = selectedFieldType == type;
                return ChoiceChip(
                  label: Text(type),
                  selected: isSelected,
                  onSelected: (selected) {
                    setState(() {
                      selectedFieldType = selected ? type : "";
                    });
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            const Text("Services"),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: services.keys.map((service) {
                return FilterChip(
                  label: Text(service),
                  selected: services[service]!,
                  onSelected: (selected) {
                    setState(() {
                      services[service] = selected;
                    });
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            const Text("Price Range (per hour)"),
            RangeSlider(
              values: RangeValues(minPrice, maxPrice),
              min: 0,
              max: 500,
              divisions: 50,
              labels: RangeLabels("\$${minPrice.toInt()}", "\$${maxPrice.toInt()}"),
              onChanged: (values) {
                setState(() {
                  minPrice = values.start;
                  maxPrice = values.end;
                });
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: () {
            // Apply filter
            widget.controller.applyFilter(
              fieldType: selectedFieldType,
              services: services,
              minPrice: minPrice,
              maxPrice: maxPrice,
            );
            Navigator.pop(context);
          },
          child: const Text("Apply"),
        ),
      ],
    );
  }
}
