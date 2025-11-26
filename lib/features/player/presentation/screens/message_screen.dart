import 'package:flutter/material.dart';
import 'package:flutter_carlos112mo/features/message/presentation/controller/msg_controller.dart';
import 'package:flutter_carlos112mo/features/message/presentation/screens/chat_screen.dart';

import 'package:get/get.dart';

import '../../../message/data/model/create_chat_request_model.dart';
import '../widgets/chat_item.dart';

// import '../../../../core/theme/app_colors.dart';
// import '../widgets/chat_item.dart';

// class MessageScreen extends StatelessWidget {
//   const MessageScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: AppColors.primaryWhite,
//         foregroundColor: AppColors.textBlack,
//         title: const Text(
//           "Back to Home",
//           style: TextStyle(color: AppColors.textBlack),
//         ),
//       ),
//       body: Column(
//         children: [
//           // User Profile Section
//           Container(
//             color: Colors.white,
//             padding: const EdgeInsets.all(16),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     CircleAvatar(
//                       radius: 28,
//                       backgroundImage: AssetImage(
//                         'assets/images/profile_sample.jpg',
//                       ),
//                     ),
//                     const SizedBox(height: 8),
//                     const Text(
//                       "Hey Mr. Raja",
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                         color: Colors.black87,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Container(
//                   decoration: BoxDecoration(
//                     color: Theme.of(context).primaryColor,
//                     shape: BoxShape.circle,
//                   ),
//                   padding: const EdgeInsets.all(12),
//                   child: const Icon(
//                     Icons.search,
//                     color: Colors.white,
//                     size: 24,
//                   ),
//                 ),
//               ],
//             ),
//           ),

//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16.0),
//             child: const Divider(height: 1),
//           ),

//           // Chat List
//           Expanded(
//             child: ListView(
//               padding: const EdgeInsets.symmetric(vertical: 8),
//               children: [
//                 ChatItem(
//                   name: "Alex Linderson",
//                   message: "How are you today?",
//                   time: "2 min ago",
//                   unreadCount: 3,
//                   avatarPath: 'assets/images/profile_sample.jpg',
//                   onTap: () {
//                     Get.to(() => ChatScreen());
//                   },
//                 ),

//                 ChatItem(
//                   name: "Alex Linderson",
//                   message: "How are you today?",
//                   time: "5 min ago",
//                   unreadCount: 1,
//                   avatarPath: 'assets/images/profile_sample.jpg',
//                   onTap: () {},
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class MessageScreen extends StatelessWidget {
  final String teamId;
  final String chatId;
  MessageScreen({super.key, required this.teamId,  required this.chatId});

  final MessageController controller = Get.find<MessageController>();
  // make sure ChatRepositoryImpl is registered in dependencies

  @override
  Widget build(BuildContext context) {
    // 🔥 API call when screen opens
    // controller.fetchChats(
    //   CreateChatRequestModel(teamId: teamId),
    // );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchAllChats(); // Pass teamId here
    });

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text("Back to Home")),

      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.msgs.isEmpty) {
          return const Center(child: Text("No chats found"));
        }

        return
         ListView.builder(
          itemCount: controller.msgs.length,
          itemBuilder: (context, index) {
            final chat = controller.msgs[index];

            return ChatItem(
              name: chat?.name ?? "",
              message: chat?.messages?.isNotEmpty == true
                  ? chat!.messages.last.text
                  : "No messages yet",
              time: chat?.updatedAt?.toString() ?? "",
              unreadCount:
                  chat?.messages?.where((m) => m.read == false).length ?? 0,
              avatarPath: 'assets/images/profile_sample.jpg',
              onTap: () {
                if (chat?.id != null) {
                  Get.to(() => ChatScreen(chatId: chatId ,));
                }
              },
            );
          },
        );
      }),
    );
  }
}
