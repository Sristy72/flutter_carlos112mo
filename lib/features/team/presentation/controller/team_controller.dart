import 'package:flutter/material.dart';
import 'package:flutter_carlos112mo/features/others/presentation/screens/dashboard_screen.dart';
import 'package:flutter_carlos112mo/features/team/data/model/create_team_request_model.dart';
import 'package:flutter_carlos112mo/features/team/data/model/get_all_team_response_model.dart';
import 'package:flutter_carlos112mo/features/team/data/model/get_single_team_response_model.dart';
import 'package:flutter_carlos112mo/features/team/domain/team_repo.dart';
import 'package:flutter_carlos112mo/features/team/presentation/screens/my_teams_screen.dart';
import 'package:get/get.dart';

import '../../../../core/base/base_controller.dart';

class TeamController extends BaseController {
  final TeamRepository _teamRepository;

  var currentTeamId = ''.obs;
  var venue = Rx<SingleTeamResponse?>(null);
  final selectedFieldId = "".obs;

  var isLoading = false.obs;
  var errorMessage = "".obs;
  var searchQuery = "".obs;

  void setLoading(bool value) => isLoading.value = value;
  void setError(String message) => errorMessage.value = message;

  TeamController(this._teamRepository);
  final Rx<GetAllTeamResponseModel?> teams = Rx(null);

  Future<void> fetchTeam() async {
    setLoading(true);

    final result = await _teamRepository.getAllTeam();

    result.fold(
      (fail) {
        setError(fail.message);
        setLoading(false);
      },
      (success) {
        teams.value = success.data;

        setLoading(false);
      },
    );
  }

  // Future<String?> createTeam(CreateTeamRequest request) async {
  //   String? teamId; // Will hold the returned team ID

  //   final result = await _teamRepository.createTeam(request);

  //   result.fold(
  //     (failure) {
  //       Get.snackbar(
  //         "Error",
  //         failure.message,
  //         backgroundColor: Colors.red.shade50,
  //         colorText: Colors.red.shade800,
  //       );
  //     },
  //     (success) {
  //       Get.snackbar(
  //         "Success",
  //         "Team created successfully",
  //         backgroundColor: Colors.green.shade50,
  //         colorText: Colors.green.shade800,
  //       );

  //       teamId = success.data.id; // Extract the generated teamId
  //       fetchTeam();
  //       Get.to(() => MyTeamsScreen()); // Optional: refresh team list
  //     },
  //   );

  //   return teamId; // Return the teamId
  // }

  Future<String?> createTeam(CreateTeamRequest request) async {
  String? teamId;

  final result = await _teamRepository.createTeam(request);

  result.fold(
    (failure) {
      // Get.snackbar(
      //   "Error",
      //   failure.message,
      //   backgroundColor: Colors.red.shade50,
      //   colorText: Colors.red.shade800,
      // );
    },
    (success) {
      // Get.snackbar(
      //   "Success",
      //   "Team created successfully",
      //   backgroundColor: Colors.green.shade50,
      //   colorText: Colors.green.shade800,
      // );

      teamId = success.data.id;

      // THIS IS THE KEY LINE YOU WERE MISSING
      currentTeamId.value = teamId!;  // Save the active team ID globally

      // Optional: Also update local teams list
      fetchTeam();

      // Navigate to MyTeamsScreen or back
      Get.off(() => MyTeamsScreen()); // or Get.back() + refresh home
    },
  );

  return teamId;
}

  Future<void> fetchSingleTeam() async {
    print("🔵 fetchSingleTeam() CALLED");

    if (selectedFieldId.isEmpty) {
      print("❌ ERROR: selectedFieldId is EMPTY!");
      return;
    }

    print("🔵 Fetching team by ID: ${selectedFieldId.value}");

    setLoading(true);

    final result = await _teamRepository.getTeamsById(selectedFieldId.value);

    result.fold(
      (fail) {
        print("❌ API FAILED: ${fail.message}");
        setError(fail.message);
        setLoading(false);
      },
      (success) {
        print("✅ API SUCCESS, DATA RECEIVED:");
        print(success.data);

        venue.value = success.data;
        setLoading(false);
      },
    );
  }
}
