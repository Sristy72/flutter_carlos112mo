import 'package:flutter/material.dart';
import 'package:flutter_carlos112mo/core/theme/app_colors.dart';
import 'package:flutter_carlos112mo/features/profile/presentation/screens/notification_screen.dart';
import 'package:flutter_carlos112mo/features/profile/presentation/widgets/personal_info_card.dart';
import 'package:flutter_carlos112mo/features/profile/presentation/widgets/change_password_card.dart';
import 'package:flutter_carlos112mo/features/profile/presentation/widgets/logout_button.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart' show Get;

import '../../../../core/common/widgets/app_scaffold.dart';
import '../../../auth/presentation/controller/auth_controller.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final authcontroller = Get.find<AuthController>();
  final _formKey = GlobalKey<FormState>();
  String _position = 'Goalkeeper';
  String _age = '20';
  String _favoriteClubs = 'FC Barcelona, Real Madrid, etc.';
  String _currentPassword = '';
  String _newPassword = '';
  String _confirmPassword = '';

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text('Arequipa, Peru', style: TextStyle(fontSize: 18)),
                SizedBox(width: 8),
                Image(
                  height: 15,
                  width: 15,
                  image: AssetImage("assets/images/location_icon.png"),
                ),
              ],
            ),
            Row(
              children: [
                Text('Mr. Raja', style: TextStyle(fontSize: 18)),
                SizedBox(width: 8),
                CircleAvatar(
                  backgroundImage: AssetImage(
                    'assets/images/profile_sample.jpg',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
          child: Form(
            key: _formKey,
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
                        onPressed: (){}, child: Row(
                      children: [
                        Icon(Icons.arrow_back_ios_new, size: 20, color: Colors.black,),
                        const SizedBox(width: 5),
                        Text(
                          'Back',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black

                          ),
                        ),
                      ],
                    )),
                    Spacer(),
                    GestureDetector(
                      onTap:() {
                        Get.to(() => NotificationsScreen());
                      },
                      child: Image.asset(
                        'assets/images/notification.png',
                        height: 40,
                        width: 40,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 24,),

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
                      onPressed: () {},
                      child: Text('Edit'),
                    ),
                  ],
                ),

                SizedBox(height: 24),

                PersonalInfoCard(
                  formKey: _formKey,
                  position: _position,
                  onPositionChanged: (v) => setState(() => _position = v),
                  age: _age,
                  onAgeChanged: (v) => setState(() => _age = v),
                  favoriteClubs: _favoriteClubs,
                  onFavoriteClubsChanged: (v) =>
                      setState(() => _favoriteClubs = v),
                ),

                SizedBox(height: 24),

                ChangePasswordCard(
                  currentPassword: _currentPassword,
                  onCurrentPasswordChanged: (v) =>
                      setState(() => _currentPassword = v),
                  newPassword: _newPassword,
                  onNewPasswordChanged: (v) => setState(() => _newPassword = v),
                  confirmPassword: _confirmPassword,
                  onConfirmPasswordChanged: (v) =>
                      setState(() => _confirmPassword = v),
                ),
                
                SizedBox(height: 24),
                LogoutButton(
                  onLogout: () {
                    // Handle logout
                    authcontroller.logout();
                  },
                ),
                const SizedBox(height: 24,)
              ],
            ),
          ),
        ),
    );
  }
}
