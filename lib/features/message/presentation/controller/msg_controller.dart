import 'package:flutter/material.dart';
import 'package:flutter_carlos112mo/features/message/data/model/get_single_chat_response_model.dart';
import 'package:flutter_carlos112mo/features/message/data/model/send_message_request_model.dart';
import 'package:flutter_carlos112mo/features/message/data/model/send_message_response_model.dart';
import 'package:get/get.dart';
import '../../data/model/create_chat_request_model.dart';
import '../../data/model/create_chat_response_model.dart';
import '../../domain/msg_repo.dart';
import '../../../../core/base/base_controller.dart';

class MessageController extends BaseController {
  final ChatRepository _chatRepository;

  MessageController(this._chatRepository);

  final RxList<SingleChatResponseModel?> msgs = RxList([]);
  var chats = <CreateChatResponseModel>[].obs; 
  var sends = <SendMessageResponseModel>[].obs; // <-- LIST TO DISPLAY ON UI
  var isLoading = false.obs;

  // Future<void> createChats(CreateChatRequestModel request) async {
  //   isLoading(true);

  //   final result = await _chatRepository.createChat(request);

  //   result.fold(
  //     (failure) {
  //       isLoading(false);
       
  //     },
  //     (success) {
  //       chats.add(success.data); // <-- Add API data into list
  //       isLoading(false);

  //       debugPrint("🚀 Chat Created Successfully");
  //     debugPrint("📌 ChatId = ${success.data.id}");

     
  //     },
  //   );
  // }

  Future<String?> createChats(CreateChatRequestModel request) async {
    isLoading(true);
    final result = await _chatRepository.createChat(request);

    return result.fold(
      (failure) {
        isLoading(false);
        debugPrint("❌ Chat Creation Failed: ${failure.message}");
        return null;
      },
      (success) {
        chats.add(success.data);
        isLoading(false);

        debugPrint("🚀 Chat Created Successfully");
        debugPrint("📌 chatId returns = ${success.data.id}");

        return success.data.id;   // << IMPORTANT
      },
    );
  }

  Future<void> fetchAllChats() async {
    setLoading(true);

    final result = await _chatRepository.getAllChat();

    result.fold(
      (fail) {
        setError(fail.message);
        setLoading(false);
      },
      (success) {
        msgs.value = success.data;

        setLoading(false);
      },
    );
  }

  Future<void> sendChats(SendMessageRequestModel request) async {
    isLoading(true);

    final result = await _chatRepository.sendChat(request);

    result.fold(
      (failure) {
        isLoading(false);
       
      },
      (success) {
        sends.add(success.data); // <-- Add API data into list
        isLoading(false);

     
      },
    );
  }
}
