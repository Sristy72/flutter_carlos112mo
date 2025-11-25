import 'package:flutter/material.dart';
import 'package:flutter_carlos112mo/core/theme/app_colors.dart';
import 'package:get/get.dart';

import '../controller/chat_controller.dart';
import '../widget/chat_widget.dart';


class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  final ChatController controller = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // ------------------ APP BAR ------------------
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          "Back to Home",
          style: TextStyle(color: Colors.black),
        ),
      ),

      // ------------------ MAIN BODY ------------------
      body: Column(
        children: [
          const SizedBox(height: 10),

          // Date text
          const Text(
            "Today",
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
          ),

          const SizedBox(height: 10),

          Expanded(
            child: Obx(() {
              return ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: controller.messages.length,
                itemBuilder: (_, index) {
                  final msg = controller.messages[index];
                  return ChatBubble(message: msg);
                },
              );
            }),
          ),

          // ------------------ MESSAGE INPUT ------------------
          Container(
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 20),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, -1),
                  blurRadius: 4,
                  color: Colors.grey.withOpacity(0.2),
                )
              ],
            ),
            child: Row(
              children: [
                 const SizedBox(width: 10),

                // Attachment icon
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset( "assets/images/clipIcon.png", height: 22, width: 22,),
                  // const Icon(Icons.attachment_outlined, size: 22),
                ),
                // Textfield
                Expanded(
                  child: Obx(
                        () => TextField(
                      onChanged: (v) => controller.messageText.value = v,
                      controller: TextEditingController(
                          text: controller.messageText.value)
                        ..selection = TextSelection.fromPosition(
                          TextPosition(offset: controller.messageText.value.length),
                        ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        hintText: "Write your message",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      ),
                    ),
                  ),
                ),

                // const SizedBox(width: 10),

                // // Attachment icon
                // Container(
                //   padding: const EdgeInsets.all(8),
                //   decoration: BoxDecoration(
                //     color: Colors.grey.shade100,
                //     shape: BoxShape.circle,
                //   ),
                //   child: const Icon(Icons.attachment_outlined, size: 22),
                // ),

                const SizedBox(width: 12),

                // Send button
                GestureDetector(
                  onTap: () {
                    controller.sendMessage(controller.messageText.value);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                      // color: AppColors.primaryGreen,
                      shape: BoxShape.circle,
                    ),
                    child: 
                    Image.asset("assets/images/sendIcon.png", height: 20, width: 20,)
                    // const Icon(Icons.send, color: Colors.white, size: 20),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

