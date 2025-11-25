// import 'package:flutter/material.dart';
// import 'package:flutter_carlos112mo/features/team/presentation/screens/create_teams_screen.dart';
// import 'package:get/get.dart';

// import '../../../../core/theme/app_colors.dart';

// class MyTeamsScreen extends StatelessWidget {
//   const MyTeamsScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[50],
//       appBar: AppBar(
//         elevation: 0,
//         title: Row(
//           children: [
//              Row(
//               children: [
//                 Text('Arequipa, Peru', style: TextStyle(fontSize: 18)),
//                 SizedBox(width: 8),
//                 Image(
//                   height: 15,
//                   width: 15,
//                   image: AssetImage("assets/images/location_icon.png"),
//                 ),
//               ],
//             ),
//           ],
//         ),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.only(right: 8.0),
//             child: Row(
//               children: [
//                 const Text(
//                   'Mr. Raja',
//                   style: TextStyle(color: Colors.white, fontSize: 16),
//                 ),
//                 const SizedBox(width: 8),
//                 CircleAvatar(
//                   radius: 18,
//                   backgroundColor: Colors.grey[300],
//                   child: const Icon(Icons.person, color: Colors.grey),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           // Header with title and button
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 const Text(
//                   'My Teams',
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black87,
//                   ),
//                 ),
//                 ElevatedButton.icon(
//                   onPressed: () {
//                     Get.to(() => const CreateTeamScreen());
//                   },
//                   icon: const Icon(Icons.add, size: 18),
//                   label: const Text('Create Team'),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: AppColors.primaryGreen,
//                     foregroundColor: Colors.white,
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 16,
//                       vertical: 12,
//                     ),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           // Teams list
//           Expanded(
//             child: ListView(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               children: [
//                 _buildTeamCard(
//                   'Team Name 1',
//                   '1 member',
//                   'Description: Lorem ipsum is a dummy or placeholder text commonly used.',
//                 ),
//                 const SizedBox(height: 16),
//                 _buildTeamCard(
//                   'Team Name 2',
//                   '1 member',
//                   'Description: Lorem ipsum is a dummy or placeholder text commonly used.',
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildTeamCard(
//     String teamName,
//     String memberCount,
//     String description,
//   ) {
//     return Card(
//       elevation: 1,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Team image
//                 Container(
//                   width: 100,
//                   height: 100,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(8),
//                     image: const DecorationImage(
//                       image: NetworkImage(
//                         'https://images.unsplash.com/photo-1574629810360-7efbbe195018?w=400',
//                       ),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 16),
//                 // Team info
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         teamName,
//                         style: const TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black87,
//                         ),
//                       ),
//                       const SizedBox(height: 4),
//                       Text(
//                         memberCount,
//                         style: TextStyle(fontSize: 14, color: Colors.grey[600]),
//                       ),
//                       const SizedBox(height: 8),
//                       Text(
//                         description,
//                         style: TextStyle(
//                           fontSize: 13,
//                           color: Colors.grey[600],
//                           height: 1.4,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 16),
//             // Action buttons
//             Row(
//               children: [
//                 Expanded(
//                   child: OutlinedButton.icon(
//                     onPressed: () {},
//                     icon: const Icon(Icons.person_add_outlined, size: 18),
//                     label: const Text('Invite People'),
//                     style: OutlinedButton.styleFrom(
//                       foregroundColor: Colors.black87,
//                       side: BorderSide(color: Colors.grey[300]!),
//                       padding: const EdgeInsets.symmetric(vertical: 12),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 12),
//                 Expanded(
//                   child: OutlinedButton.icon(
//                     onPressed: () {},
//                     icon: const Icon(Icons.calendar_today, size: 18),
//                     label: const Text('Schedule Match'),
//                     style: OutlinedButton.styleFrom(
//                       foregroundColor: Colors.black87,
//                       side: BorderSide(color: Colors.grey[300]!),
//                       padding: const EdgeInsets.symmetric(vertical: 12),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_carlos112mo/features/team/presentation/screens/create_teams_screen.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../player/presentation/widgets/availability_dialog.dart';
import '../controller/team_controller.dart';

class MyTeamsScreen extends StatefulWidget {
  const MyTeamsScreen({Key? key}) : super(key: key);

  @override
  State<MyTeamsScreen> createState() => _MyTeamsScreenState();
}

class _MyTeamsScreenState extends State<MyTeamsScreen> {
  final controller = Get.find<TeamController>();

  @override
  void initState() {
    super.initState();
    controller.fetchTeam();
    // controller.fetchSingleTeam(); // Fetch once
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        elevation: 0,
        title: Row(
          children: const [
            Text('Arequipa, Peru', style: TextStyle(fontSize: 18)),
            SizedBox(width: 8),
            Image(
              height: 15,
              width: 15,
              image: AssetImage("assets/images/location_icon.png"),
            ),
          ],
        ),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // HEADER SECTION
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'My Teams',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Get.to(() => const CreateTeamScreen());
                  },
                  icon: const Icon(Icons.add, size: 18),
                  label: const Text('Create Team'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryGreen,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // TEAM LIST
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              if (controller.errorMessage.isNotEmpty) {
                return Center(child: Text(controller.errorMessage.value));
              }

              final teams = controller.teams.value?.teams ?? [];

              if (teams.isEmpty) {
                return const Center(child: Text("No teams found."));
              }

              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: teams.length,
                itemBuilder: (context, index) {
                  final team = teams[index];

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: _buildTeamCard(
                      team.id,
                      team.name,
                      "${team.members.length} member(s)",
                      team.description,
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildTeamCard(
    String id,
    String teamName,
    String memberCount,
    String description,
  ) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: const DecorationImage(
                      image: NetworkImage(
                        'https://images.unsplash.com/photo-1574629810360-7efbbe195018?w=400',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 16),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        teamName,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        memberCount,
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        description,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey[600],
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.person_add_outlined, size: 18),
                    label: const Text('Invite People'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.black87,
                      side: BorderSide(color: Colors.grey[300]!),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () async {
                      print("👉 CLICKED Schedule Match for Team ID: $id");

                      controller.selectedFieldId.value = id;

                      print(
                        "👉 selectedFieldId set to: ${controller.selectedFieldId.value}",
                      );

                      // await controller
                      //     .fetchSingleTeam(); // wait before showing dialog

                      showDialog(
                        context: context,
                        builder: (_) =>  AvailabilityDialog( teamId: id,),
                      );
                    },

                    icon: const Icon(Icons.calendar_today, size: 18),
                    label: const Text('Schedule Match'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.black87,
                      side: BorderSide(color: Colors.grey[300]!),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
