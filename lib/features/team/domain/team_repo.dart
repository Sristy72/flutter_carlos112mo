import 'package:dio/dio.dart';
import 'package:flutter_carlos112mo/features/player/data/model/get_all_fields_response_model.dart';
import 'package:flutter_carlos112mo/features/team/data/model/create_team_request_model.dart';
import 'package:flutter_carlos112mo/features/team/data/model/create_team_response_model.dart';
import 'package:flutter_carlos112mo/features/team/data/model/get_all_team_response_model.dart';

import '../../../core/network/network_result.dart';
import '../data/model/get_single_team_response_model.dart';

abstract class TeamRepository {
  NetworkResult<GetAllTeamResponseModel> getAllTeam();
  NetworkResult<CreateTeamResponse> createTeam(CreateTeamRequest request);
  NetworkResult<SingleTeamResponse> getTeamsById(String id);
}
