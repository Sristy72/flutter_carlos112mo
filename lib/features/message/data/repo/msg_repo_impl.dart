import 'package:flutter_carlos112mo/features/message/data/model/create_chat_request_model.dart';
import 'package:flutter_carlos112mo/features/message/data/model/create_chat_response_model.dart';
import 'package:flutter_carlos112mo/features/message/data/model/get_single_chat_response_model.dart';
import 'package:flutter_carlos112mo/features/message/data/model/send_message_request_model.dart';
import 'package:flutter_carlos112mo/features/message/data/model/send_message_response_model.dart';

import '../../../../core/network/api_client.dart';
import '../../../../core/network/constants/api_constants.dart';
import '../../../../core/network/network_result.dart';
import '../../domain/msg_repo.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ApiClient _apiClient;

  ChatRepositoryImpl({required ApiClient apiClient}) : _apiClient = apiClient;

  @override
  NetworkResult<CreateChatResponseModel> createChat(
    CreateChatRequestModel request,
  ) {
    return _apiClient.post<CreateChatResponseModel>(
      ApiConstants.chat.create,
      data: request.toJson(),
      fromJsonT: (json) => CreateChatResponseModel.fromJson(json),
      // isFormData: true
    );
  }

  @override
  NetworkResult<List<SingleChatResponseModel>> getAllChat() {
    return _apiClient.get(
      ApiConstants.chat.getChat,
      fromJsonT: (json) => (json as List)
          .map((item) => SingleChatResponseModel.fromJson(item))
          .toList(),
    );
  }


  @override
  NetworkResult<SendMessageResponseModel> sendChat(
    SendMessageRequestModel request,
  ) {
    return _apiClient.post<SendMessageResponseModel>(
      ApiConstants.chat.sendChat,
      data: request.toJson(),
      fromJsonT: (json) => SendMessageResponseModel.fromJson(json),
      // isFormData: true
    );
  }
}
