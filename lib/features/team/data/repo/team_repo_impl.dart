import 'package:dio/dio.dart';
import 'package:flutter_carlos112mo/features/player/data/model/get_all_fields_response_model.dart';
import 'package:flutter_carlos112mo/features/player/data/model/get_single_fields_response_model.dart';
import 'package:flutter_carlos112mo/features/team/data/model/create_team_request_model.dart';
import 'package:flutter_carlos112mo/features/team/data/model/create_team_response_model.dart';
import 'package:flutter_carlos112mo/features/team/data/model/get_all_team_response_model.dart';

import '../../../../core/network/api_client.dart';
import '../../../../core/network/constants/api_constants.dart';
import '../../../../core/network/network_result.dart';
import '../../domain/team_repo.dart';


class TeamRepositoryImpl implements TeamRepository {
  final ApiClient _apiClient;

  TeamRepositoryImpl({required ApiClient apiClient}) : _apiClient = apiClient;

 @override
NetworkResult<GetAllTeamResponseModel> getAllTeam() {
  return _apiClient.get<GetAllTeamResponseModel>(
    ApiConstants.team.getTeams,
    fromJsonT: (json) => GetAllTeamResponseModel.fromJson(json),
  );
}
 @override
  NetworkResult<CreateTeamResponse> createTeam(CreateTeamRequest request) {
    return _apiClient.post<CreateTeamResponse>(
      ApiConstants.team.create,
      data: request.toJson(),
      fromJsonT: (json) => CreateTeamResponse.fromJson(json),
      // isFormData: true
    );
  }
 

}
