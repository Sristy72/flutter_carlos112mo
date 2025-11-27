import 'package:flutter_carlos112mo/features/message/data/model/create_chat_request_model.dart';
import 'package:flutter_carlos112mo/features/message/data/model/create_chat_response_model.dart';
import 'package:flutter_carlos112mo/features/message/data/model/get_single_chat_response_model.dart';
import 'package:flutter_carlos112mo/features/message/data/model/message_response_model.dart';

import '../../../core/network/network_result.dart';
import '../data/model/send_message_request_model.dart';
import '../data/model/send_message_response_model.dart';

abstract class ChatRepository {
  NetworkResult<CreateChatResponseModel> createChat(
    CreateChatRequestModel request,
  );
  NetworkResult<List<SingleChatResponseModel>> getAllChat();
  NetworkResult<Message> sendChat(SendMessageRequestModel request);
  NetworkResult<SingleChatResponseModel> getChatbyId(String id);
}
