import 'package:flutter/material.dart';
import 'package:flutter_carlos112mo/features/Owner/presentation/screens/dashboard_edit_field.dart';
import 'package:flutter_carlos112mo/features/Owner/presentation/screens/owner_home_screen.dart';
import 'package:flutter_carlos112mo/features/Owner/presentation/screens/profile_screen.dart';
import 'package:flutter_carlos112mo/features/others/presentation/widgets/owner_app_bottom_nav_bar.dart';

import '../../../Owner/presentation/screens/add_field_screen.dart';


class OwnerNavScreen extends StatefulWidget {
  const OwnerNavScreen({super.key});

  @override
  State<OwnerNavScreen> createState() => _OwnerNavScreenState();
}

class _OwnerNavScreenState extends State<OwnerNavScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    Center(child: OwnerHomeScreen()),
    Center(child: OwnerDashboardScreen()),
    Center(child: AddFieldScreen()),
    Center(child: ProfileScreen()),
   
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
