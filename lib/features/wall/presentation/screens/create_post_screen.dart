import 'package:flutter/material.dart';
import 'package:flutter_carlos112mo/core/common/widgets/app_scaffold.dart';
import 'package:flutter_carlos112mo/core/theme/app_colors.dart';
import 'package:flutter_carlos112mo/core/theme/input_decoration_extensions.dart';
import 'package:flutter_carlos112mo/features/wall/presentation/controller/create_post_controller.dart';
import 'package:get/get.dart';

import '../../../profile/presentation/controllers/user_profie_controller.dart';

class CreatePostScreen extends StatelessWidget {
  const CreatePostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final UserProfileController userProfileController =
        Get.find<UserProfileController>();
    final CreatePostController createPostController =
        Get.find<CreatePostController>();
    return AppScaffold(
      appBar: AppBar(
        title: Text(
          'Create Post',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 24),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white70,
                          radius: 20,
                          foregroundImage:
                              (userProfileController
                                          .userProfileModel
                                          ?.avatar
                                          ?.url !=
                                      null &&
                                  userProfileController
                                      .userProfileModel!
                                      .avatar!
                                      .url!
                                      .isNotEmpty)
                              ? NetworkImage(
                                  userProfileController
                                      .userProfileModel!
                                      .avatar!
                                      .url!,
                                )
                              : null,
                          child: Icon(Icons.person),
                        ),
                        SizedBox(width: 8),
                        Text(
                          userProfileController.userProfileModel?.name ?? '',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      maxLines: 5,
                      decoration: context.primaryInputDecoration.copyWith(
                        hintText: 'What\'s on your mind?',
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Expanded(
                          child: Obx(
                            () => OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                backgroundColor:
                                    createPostController.isMatchInvitation.value
                                    ? null
                                    : Color(0xFFE6F5F3),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  side: BorderSide(color: Color(0xFF00917B)),
                                ),
                              ),
                              onPressed: () {
                                createPostController.isMatchInvitation.value =
                                    false;
                              },
                              child: Text('General Post'),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Obx(
                            () => OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                backgroundColor:
                                    createPostController.isMatchInvitation.value
                                    ? Color(0xFFE6F5F3)
                                    : null,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  side: BorderSide(color: Color(0xFF00917B)),
                                ),
                              ),
                              onPressed: () {
                                createPostController.isMatchInvitation.value =
                                    true;
                              },
                              child: Text('Match Invitation'),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        SizedBox(width: 85),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black26,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () {
                              Get.back();
                            },
                            child: Text('Cancel'),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF00917B),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () {},
                            child: Text('Post'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),
            Obx(
              () => createPostController.isMatchInvitation.value
                  ? Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Match Details',
                              style: TextStyle(fontSize: 16),
                            ),
                            const SizedBox(height: 16),
                            Text('Match name'),
                            const SizedBox(height: 8),
                            TextFormField(
                              decoration: context.primaryInputDecoration
                                  .copyWith(hintText: 'Green Valley Field'),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                Text('Date'),
                                Spacer(),
                                TextButton(
                                  onPressed: () {},
                                  child: Text('Change'),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Expanded(
                                  child: Obx(
                                    () => TextFormField(
                                      readOnly: true,
                                      onTap: () => createPostController
                                          .pickDate(context),
                                      decoration: context.primaryInputDecoration
                                          .copyWith(
                                            prefixIcon: Icon(
                                              Icons.calendar_today_outlined,
                                              color: AppColors.borderGrey,
                                              size: 20,
                                            ),
                                            hintText: 'dd/mm/yyyy',
                                          ),
                                      controller:
                                          TextEditingController(
                                              text: createPostController
                                                  .selectedDate
                                                  .value,
                                            )
                                            ..selection =
                                                TextSelection.collapsed(
                                                  offset: createPostController
                                                      .selectedDate
                                                      .value
                                                      .length,
                                                ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Obx(
                                    () => TextFormField(
                                      readOnly: true,
                                      onTap: () => createPostController
                                          .pickTime(context),
                                      decoration: context.primaryInputDecoration
                                          .copyWith(
                                            prefixIcon: Icon(
                                              Icons.access_time_outlined,
                                              color: AppColors.borderGrey,
                                              size: 20,
                                            ),
                                            hintText: '--:-- --',
                                          ),
                                      controller:
                                          TextEditingController(
                                              text: createPostController
                                                  .selectedTime
                                                  .value,
                                            )
                                            ..selection =
                                                TextSelection.collapsed(
                                                  offset: createPostController
                                                      .selectedTime
                                                      .value
                                                      .length,
                                                ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Text('Field'),
                            const SizedBox(height: 8),
                            DropdownButtonFormField<String>(
                              value: 'Select a field',
                              decoration: context.primaryInputDecoration,
                              items:
                                  [
                                        'Select a field',
                                        'Field 1',
                                        'Field 2',
                                        'Field 3',
                                      ]
                                      .map(
                                        (label) => DropdownMenuItem(
                                          value: label,
                                          child: Text(label),
                                        ),
                                      )
                                      .toList(),
                              onChanged: (value) {},
                            ),
                            const SizedBox(height: 16),
                            Text('Select Team (Optional)'),
                            const SizedBox(height: 8),
                            DropdownButtonFormField<String>(
                              value: 'Select a team',
                              decoration: context.primaryInputDecoration,
                              items:
                                  [
                                        'Select a team',
                                        'Team 1',
                                        'Team 2',
                                        'Team 3',
                                      ]
                                      .map(
                                        (label) => DropdownMenuItem(
                                          value: label,
                                          child: Text(label),
                                        ),
                                      )
                                      .toList(),
                              onChanged: (value) {},
                            ),
                            const SizedBox(height: 16),
                            Text('Player Needed'),
                            const SizedBox(height: 8),
                            TextFormField(
                              decoration: context.primaryInputDecoration,
                            ),
                            const SizedBox(height: 16),
                            Text('Or'),
                            const SizedBox(height: 16),
                            Text('Invite People'),
                            const SizedBox(height: 8),
                            TextFormField(
                              decoration: context.primaryInputDecoration
                                  .copyWith(
                                    prefixIcon: Icon(
                                      Icons.person_add_alt_outlined,
                                      color: AppColors.borderGrey,
                                      size: 20,
                                    ),
                                    hintText: 'Invite people',
                                  ),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                SizedBox(width: 85),
                                Expanded(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.black26,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: Text('Cancel'),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xFF00917B),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    onPressed: () {},
                                    child: Text('Post'),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  : Container(),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
