import 'package:flutter/material.dart';
import 'package:flutter_carlos112mo/features/Owner/presentation/screens/dashboard_edit_field.dart';
import 'package:flutter_carlos112mo/features/Owner/presentation/screens/owner_home_screen.dart';
import 'package:flutter_carlos112mo/features/bookings/presentation/screens/bookings_screen.dart';
import 'package:flutter_carlos112mo/features/others/presentation/widgets/owner_app_bottom_nav_bar.dart';
import 'package:flutter_carlos112mo/features/player/presentation/screens/my_teams_screen.dart';
import 'package:flutter_carlos112mo/features/player/presentation/screens/player_fields_screen.dart';
import 'package:flutter_carlos112mo/features/player/presentation/screens/player_home_screen.dart';
import 'package:flutter_carlos112mo/features/wall/presentation/screens/wall_screen.dart';
import '../../Owner/presentation/screens/add_field_screen.dart';
import '../../others/presentation/widgets/app_bottom_nav_bar.dart';


class OwnerNavScreen extends StatefulWidget {
  const OwnerNavScreen({super.key});

  @override
  State<OwnerNavScreen> createState() => _OwnerNavScreenState();
}

class _OwnerNavScreenState extends State<OwnerNavScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    Center(child: OwnerHomeScreen()),
    Center(child: OwnerDashboardEditScreen()),
    Center(child: AddFieldScreen()),
    // Center(child: MyprofileScreen()),
   
  ];

  void _onTabSelected(int index) {
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: OwnerAppBottomNavBar(
        currentIndex: _currentIndex,
        onTabSelected: _onTabSelected,
      ),
    );
  }
}
