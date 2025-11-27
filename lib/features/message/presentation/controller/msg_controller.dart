import 'package:flutter/material.dart';
import 'package:flutter_carlos112mo/features/message/data/model/get_single_chat_response_model.dart';
import 'package:flutter_carlos112mo/features/message/data/model/send_message_request_model.dart';
import 'package:flutter_carlos112mo/features/message/data/model/send_message_response_model.dart';
import 'package:flutx_core/core/debug_print.dart';
import 'package:get/get.dart';
import '../../../../core/network/services/auth_storage_service.dart';
import '../../../../core/network/services/socket_client.dart';
import '../../data/model/create_chat_request_model.dart';
import '../../data/model/create_chat_response_model.dart';
import '../../data/model/message_response_model.dart';
import '../../domain/msg_repo.dart';
import '../../../../core/base/base_controller.dart';

class MessageController extends BaseController {
  final ChatRepository _chatRepository;

  MessageController(this._chatRepository);

  // final RxList<SingleChatResponseModel?> msgs = RxList<SingleChatResponseModel>();
  final RxList<SingleChatResponseModel?> allMsg =
      RxList<SingleChatResponseModel>();

  final RxList<Message?> msgs = RxList<Message>();

  final RxString currentUserId = ''.obs;

  var chats = <CreateChatResponseModel>[].obs;

  var isLoading = false.obs;

  var isSending = false.obs;

  String chatId = '';
  var chatMessages = <SendMessageResponseModel>[].obs;
  SocketClient _client = SocketClient(); // store API messages

  @override
  void onInit() {
    super.onInit();
    loadCurrentUserId(); // ← Load it once when controller starts
  }

  Future<void> socketInitChat() async {
    _client.emit("join", chatId);

    _client.on("message", (data) {
      DPrint.log("Raw socket message received: $data");
    });
  }

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

         chatId = success.data.id;
        chats.add(success.data);
        isLoading(false);

        debugPrint("🚀 Chat Created Successfully");
        debugPrint("📌 chatId returns = ${success.data.id}");

        return success.data.id; // << IMPORTANT
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
        allMsg.addAll(success.data); // = success.data;

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
        msgs.add(success.data); // <-- Add API data into list
        isLoading(false);
        print("📩 Message Sent Successfully ✔");
      },
    );
  }

  Future<void> loadCurrentUserId() async {
    final userId = await AuthStorageService().getUserId();
    if (userId != null) {
      currentUserId.value = userId;
    }
  }

  Future<void> getChatById(String id) async {
    final response = await _chatRepository.getChatbyId(id);
    response.fold(
      (fail) {
        debugPrint("❌ Failed to fetch chat: ${fail.message}");
      },
      (success) {
        msgs.clear();
        msgs.addAll(
          success.data.messages,
        ); // if success.data.messages is List<Message>
      },
    );
  }
}
