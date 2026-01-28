import 'package:flutter/material.dart';
import 'package:flutter_carlos112mo/core/theme/app_colors.dart';

import '../../data/model/message_response_model.dart';
import '../../data/model/send_message_response_model.dart';


class ChatBubble extends StatelessWidget {
  final Message message;
  final String? currentUserId;
  final String chatUserName; // pass current logged-in user id

  const ChatBubble({
    super.key,
    required this.message,
     this.currentUserId,
    required this.chatUserName,
  });

  @override
  Widget build(BuildContext context) {
    final isMe = message.user == currentUserId;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          // Avatar for messages from others
          if (!isMe)
            CircleAvatar(
              radius: 18,
              child: const Icon(Icons.person),
            ),

          if (!isMe) const SizedBox(width: 8),

          // Message column
          Column(
            crossAxisAlignment:
                isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              // Show username for messages from others
              if (!isMe)
                Text(
                  // message.user,
                  chatUserName,
                  style: const TextStyle(
                      fontSize: 13, fontWeight: FontWeight.w600),
                ),
              if (!isMe) const SizedBox(height: 4),

              // Message bubble
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 14, vertical: 10),
                constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
                decoration: BoxDecoration(
                  color:
                      isMe ? AppColors.primaryGreen : Colors.grey.shade200,
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(14),
                    topRight: const Radius.circular(14),
                    bottomLeft:
                        isMe ? const Radius.circular(14) : const Radius.circular(0),
                    bottomRight:
                        isMe ? const Radius.circular(0) : const Radius.circular(14),
                  ),
                ),
                child: Text(
                  message.text,
                  style: TextStyle(
                    color: isMe ? Colors.white : Colors.black87,
                    fontSize: 14,
                  ),
                ),
              ),

              const SizedBox(height: 4),

              // Time + optional read/accept status
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    _formatTime(message.date),
                    style: const TextStyle(fontSize: 11, color: Colors.grey),
                  ),
                  if (isMe) const SizedBox(width: 4),
                  if (isMe)
                    Icon(
                      message.read
                          ? Icons.done_all
                          : Icons.done,
                      size: 16,
                      color: message.read ? Colors.blue : Colors.grey,
                    ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

 String _formatTime(DateTime time) {
  final localTime = time.toLocal(); // convert to device's local time
  final hour = localTime.hour.toString().padLeft(2, '0');
  final minute = localTime.minute.toString().padLeft(2, '0');
  return "$hour:$minute";
}

}
