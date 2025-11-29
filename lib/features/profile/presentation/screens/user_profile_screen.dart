import 'package:flutter/material.dart';
import 'package:flutter_carlos112mo/core/theme/app_colors.dart';
import 'package:flutter_carlos112mo/features/profile/presentation/controllers/user_profie_controller.dart';
import 'package:flutter_carlos112mo/features/profile/presentation/screens/notification_screen.dart';
import 'package:flutter_carlos112mo/features/profile/presentation/widgets/logout_button.dart';
import 'package:get/get.dart';
import '../../../../core/common/widgets/app_scaffold.dart';
import '../../../auth/presentation/controller/auth_controller.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final UserProfileController userProfileController =
        Get.find<UserProfileController>();
    final AuthController authController = Get.find<AuthController>();

    return AppScaffold(
      showDefaultAppBar: true,
      body: Obx(
        () => userProfileController.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 24),
                    Row(
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size(0, 0),
                          ),
                          onPressed: () {
                            Get.back();
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.arrow_back_ios_new,
                                size: 20,
                                color: Colors.black,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Back',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => NotificationsScreen());
                          },
                          child: Image.asset(
                            'assets/images/notification.png',
                            height: 40,
                            width: 40,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'My Profile',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            minimumSize: Size(80, 38),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                            userProfileController.isFieldEditable.value =
                                !userProfileController.isFieldEditable.value;
                          },
                          child: Text(
                            userProfileController.isFieldEditable.value
                                ? 'Cancel'
                                : 'Edit',
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 24),

                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.4),
                            blurRadius: 4,
                            offset: Offset(0, 0),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Form(
                          key: userProfileController.profileFormKey,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Spacer(),
                                  Stack(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: Colors.grey.shade200,
                                        radius: 50,
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
                                        child: Icon(
                                          Icons.person,
                                          size: 80,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      userProfileController
                                              .isFieldEditable
                                              .value
                                          ? Positioned(
                                              bottom: 0,
                                              right: 0,
                                              child: GestureDetector(
                                                onTap: () {
                                                  userProfileController
                                                      .pickImage();
                                                },
                                                child: Image.asset(
                                                  'assets/images/edit_circle.png',
                                                  height: 35,
                                                  width: 35,
                                                ),
                                              ),
                                            )
                                          : Container(),
                                    ],
                                  ),
                                  SizedBox(width: 8),

                                  Column(
                                    children: [
                                      Text('Profile completion'),
                                      SizedBox(height: 8),
                                      Container(
                                        width: 60,
                                        height: 38,
                                        decoration: BoxDecoration(
                                          color: AppColors.primaryGreen,
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '75%',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 16),
                              Text(
                                userProfileController.userProfileModel?.name ??
                                    '',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),

                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    top: 24.0,
                                    bottom: 8.0,
                                  ),
                                  child: Text('Full Name'),
                                ),
                              ),
                              TextFormField(
                                enabled:
                                    userProfileController.isFieldEditable.value,
                                controller:
                                    userProfileController.nameController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 16,
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your name';
                                  }
                                  return null;
                                },
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    top: 24.0,
                                    bottom: 8.0,
                                  ),
                                  child: Text('Phone Number'),
                                ),
                              ),
                              TextFormField(
                                enabled:
                                    userProfileController.isFieldEditable.value,
                                controller:
                                    userProfileController.phoneNumberController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 16,
                                  ),
                                ),
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your phone number';
                                  }
                                  return null;
                                },
                              ),

                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    top: 24.0,
                                    bottom: 8.0,
                                  ),
                                  child: Text('Position'),
                                ),
                              ),
                              DropdownButtonFormField<String>(
                                value:
                                    userProfileController.position.value.isEmpty
                                    ? null
                                    : userProfileController.position.value,

                                decoration: InputDecoration(
                                  enabled: userProfileController
                                      .isFieldEditable
                                      .value,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 16,
                                  ),
                                ),
                                items:
                                    [
                                          'Goalkeeper',
                                          'Defender',
                                          'Midfielder',
                                          'Forward',
                                        ]
                                        .map(
                                          (label) => DropdownMenuItem(
                                            value: label,
                                            child: Text(label),
                                          ),
                                        )
                                        .toList(),
                                onChanged:
                                    userProfileController.isFieldEditable.value
                                    ? (value) {
                                        userProfileController.changePosition(
                                          value!,
                                        );
                                      }
                                    : null,
                              ),

                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    top: 24.0,
                                    bottom: 8.0,
                                  ),
                                  child: Text('Age'),
                                ),
                              ),
                              TextFormField(
                                enabled:
                                    userProfileController.isFieldEditable.value,
                                controller: userProfileController.ageController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 16,
                                  ),
                                ),
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your age';
                                  }
                                  return null;
                                },
                              ),

                              // Favorite Clubs label and field
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    top: 24.0,
                                    bottom: 8.0,
                                  ),
                                  child: Text('Favorite Clubs'),
                                ),
                              ),
                              TextFormField(
                                enabled:
                                    userProfileController.isFieldEditable.value,
                                controller: userProfileController
                                    .favoriteClubsController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 16,
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your favorite clubs';
                                  }
                                  return null;
                                },
                              ),

                              // Location label and field
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    top: 12.0,
                                    bottom: 8.0,
                                  ),
                                  child: Text('Location'),
                                ),
                              ),
                              TextFormField(
                                enabled:
                                    userProfileController.isFieldEditable.value,
                                controller:
                                    userProfileController.locationController,
                                decoration: InputDecoration(
                                  suffixIcon: Icon(Icons.my_location),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 16,
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your location';
                                  }
                                  return null;
                                },
                              ),

                              SizedBox(height: 24),

                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    minimumSize: Size(double.infinity, 48),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  onPressed: () {
                                    if (userProfileController
                                        .profileFormKey
                                        .currentState!
                                        .validate()) {
                                      userProfileController.updateUserProfile();
                                    }
                                  },
                                  child: Text('Save Changes'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 16),

                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.4),
                            blurRadius: 4,
                            offset: Offset(0, 0),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Form(
                          key: userProfileController.passwordFormKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Change Password'),

                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    top: 24.0,
                                    bottom: 8.0,
                                  ),
                                  child: Text('Current Password'),
                                ),
                              ),
                              TextFormField(
                                controller:
                                    userProfileController.oldPasswordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 14,
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your current password';
                                  }
                                  return null;
                                },
                              ),

                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    top: 24.0,
                                    bottom: 8.0,
                                  ),
                                  child: Text('New Password'),
                                ),
                              ),
                              TextFormField(
                                controller:
                                    userProfileController.newPasswordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 14,
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your new password';
                                  }
                                  return null;
                                },
                              ),

                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    top: 24.0,
                                    bottom: 8.0,
                                  ),
                                  child: Text('Confirm New Password'),
                                ),
                              ),
                              TextFormField(
                                controller: userProfileController
                                    .confirmPasswordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 14,
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please confirm your new password';
                                  }
                                  if (value !=
                                      userProfileController
                                          .newPasswordController
                                          .text) {
                                    return 'Passwords do not match';
                                  }
                                  return null;
                                },
                              ),

                              SizedBox(height: 24),

                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    minimumSize: Size(double.infinity, 48),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),

                                  onPressed: () {
                                    if (userProfileController
                                        .passwordFormKey
                                        .currentState!
                                        .validate()) {
                                      userProfileController.changePassword();
                                    }
                                  },
                                  child: Text('Update Password'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 24),
                    LogoutButton(
                      onLogout: () {
                        authController.logout();
                      },
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
      ),
    );
  }
}
