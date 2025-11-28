import 'package:flutter/material.dart';
import 'package:flutter_carlos112mo/features/message/presentation/screens/chat_screen.dart';
import 'package:flutter_carlos112mo/features/player/presentation/widgets/chat_item.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_colors.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.primaryWhite,
        foregroundColor: AppColors.textBlack,
        title: const Text(
          "Back to Home",
          style: TextStyle(color: AppColors.textBlack),
        ),
      ),
      body: Column(
        children: [
          // User Profile Section
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundImage: AssetImage(
                        'assets/images/profile_sample.jpg',
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Hey Mr. Raja",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(12),
                  child: const Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: const Divider(height: 1),
          ),

          // Chat List
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 8),
              children: [
                ChatItem(
                  name: "Alex Linderson",
                  message: "How are you today?",
                  time: "2 min ago",
                  unreadCount: 3,
                  avatarPath: 'assets/images/profile_sample.jpg',
                  onTap: () {
                    Get.to(() => ChatScreen());
                  },
                ),

                ChatItem(
                  name: "Alex Linderson",
                  message: "How are you today?",
                  time: "5 min ago",
                  unreadCount: 1,
                  avatarPath: 'assets/images/profile_sample.jpg',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
