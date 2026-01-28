import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../features/profile/presentation/controllers/user_profie_controller.dart';

class AppScaffold extends StatelessWidget {
  final Widget body;
  final AppBar? appBar;
  final Widget? drawer;
  final bool removePadding;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final bool showDefaultAppBar;

  const AppScaffold({
    super.key,
    this.appBar,
    this.drawer,
    required this.body,
    this.removePadding = false,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.showDefaultAppBar = false,
  });

  @override
  Widget build(BuildContext context) {
    final UserProfileController userProfileController = Get.find<UserProfileController>();
    return Scaffold(
      drawer: drawer,
      appBar: showDefaultAppBar? AppBar(
        title: Obx(
              () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text('Arequipa, Peru', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                  SizedBox(width: 8),
                  Image(
                    height: 18,
                    width: 18,
                    image: AssetImage("assets/images/location_icon.png"),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(userProfileController.userProfileModel?.name ?? '', style: TextStyle(fontSize: 18)),
                  SizedBox(width: 8),
                  CircleAvatar(
                    backgroundColor: Colors.white70,
                    radius: 17,
                    foregroundImage: (userProfileController.userProfileModel?.avatar?.url != null &&
                        userProfileController.userProfileModel!.avatar!.url!.isNotEmpty)
                        ? NetworkImage(userProfileController.userProfileModel!.avatar!.url!)
                        : null,
                    child: Icon(Icons.person),
                  ),

                ],
              ),
            ],
          ),
        ),
      ) : appBar,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: removePadding ? 0 : 18),
        child: body,
      ),
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
