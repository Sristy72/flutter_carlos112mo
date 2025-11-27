import 'package:flutter/material.dart';
import 'package:flutter_carlos112mo/core/network/services/socket_client.dart';
import 'package:flutter_carlos112mo/core/theme/app_colors.dart';
import 'package:flutx_core/flutx_core.dart';
import 'package:get/get.dart';

import '../../data/model/get_single_chat_response_model.dart';
import '../../data/model/message_response_model.dart';
import '../../data/model/send_message_request_model.dart';
import '../controller/chat_controller.dart';
import '../controller/msg_controller.dart';
import '../widget/chat_widget.dart';

class ChatScreen extends StatefulWidget {
  final SingleChatResponseModel chat;
  
  const ChatScreen({super.key, required this.chat});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  // final ChatController controller = Get.put(ChatController());

  final MessageController msgcontroller = Get.find<MessageController>();
  final ScrollController _scrollController = ScrollController();

  final TextEditingController msg = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Fetch messages from API
    msgcontroller.getChatById(widget.chat.id);
    // Scroll to bottom whenever messages change
    ever(msgcontroller.msgs, (_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
    _joinFunction();
    msgcontroller.socketInitChat();
  }

  _joinFunction(){
    SocketClient().emit("joinChatRoom", widget.chat.id);
    SocketClient().on("newMassage", (data) {
      DPrint.log("Raw socket message received: $data");
      msgcontroller.msgs.add(Message.fromJson(data));
    });
  }

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
                controller: _scrollController,
                // latest message at bottom
                padding: const EdgeInsets.all(16),
                itemCount: msgcontroller.msgs.length,
                itemBuilder: (_, index) {
                  final message = msgcontroller.msgs[index];
                  return ChatBubble(
                    message: message!,
                    currentUserId:
                        msgcontroller.currentUserId.value,
                        chatUserName: widget.chat.name, // if you have
                  );
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
                ),
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
                  child: Image.asset(
                    "assets/images/clipIcon.png",
                    height: 22,
                    width: 22,
                  ),
                  // const Icon(Icons.attachment_outlined, size: 22),
                ),
                // Textfield
                Expanded(
                  child: TextField(
                    controller: msg,
                    onChanged: (v) => msgcontroller.chatMessages,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      hintText: "Write your message",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
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
                  onTap: () async {
                    if (msg.text.trim().isEmpty) return;

                    // 1️⃣ Instant UI update
                    msgcontroller.msgs.insert(
                      0,
                      Message(
                        text: msg.text,
                        user: msgcontroller.currentUserId.value,
                        date: DateTime.now(),
                        read: false,
                        accept: false,
                        id: '',
                      ),
                    );

                    final req = SendMessageRequestModel(
                      chatId: widget.chat.id,
                      message: msg.text,
                    );

                    await msgcontroller.sendChats(req);

                    msg.clear();
                  },

                  child: Container(
                    padding: const EdgeInsets.all(12),
                    child: Image.asset(
                      "assets/images/sendIcon.png",
                      height: 20,
                      width: 20,
                    ),
                  ),
                ),

                // GestureDetector(
                //   onTap: () {
                //     controller.sendMessage(controller.messageText.value);
                //   },
                //   child: Container(
                //     padding: const EdgeInsets.all(12),
                //     decoration: const BoxDecoration(
                //       // color: AppColors.primaryGreen,
                //       shape: BoxShape.circle,
                //     ),
                //     child:
                //     Image.asset("assets/images/sendIcon.png", height: 20, width: 20,)
                //     // const Icon(Icons.send, color: Colors.white, size: 20),
                //   ),
                // )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
