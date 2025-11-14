import 'package:flutter/material.dart';
import '../../../../core/common/widgets/app_scaffold.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: const Text(
          'Notifications',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 24,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "New",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 16),
            ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return _notificationItem();
              },
            ),
            const SizedBox(height: 32),
            const Text(
              "Earlier",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 16),
            ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return _notificationItem();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _notificationItem() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(
                child: Text(
                  "Lorem ipsum is a dummy or placeholder text commonly used in graphic",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              const Text(
                '25 min',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        const Divider(color: Colors.teal),
        const SizedBox(height: 8),
      ],
    );
  }
}
