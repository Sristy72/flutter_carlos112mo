import 'package:flutter/material.dart';
import 'package:flutter_carlos112mo/features/bookings/presentation/screens/bookings_screen.dart';
import 'package:flutter_carlos112mo/features/team/presentation/screens/my_teams_screen.dart';
import 'package:flutter_carlos112mo/features/player/presentation/screens/player_fields_screen.dart';
import 'package:flutter_carlos112mo/features/player/presentation/screens/player_home_screen.dart';
import 'package:flutter_carlos112mo/features/wall/presentation/screens/wall_screen.dart';
import '../widgets/app_bottom_nav_bar.dart';

class DashboardScreen extends StatefulWidget {
  final int initialIndex;
  const DashboardScreen({super.key, this.initialIndex = 0});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    Center(child: PlayerHomeScreen()),
    Center(child: PlayerFieldsScreen()),
    Center(child: BookingsScreen()),
    Center(child: MyTeamsScreen()),
    Center(child: WallScreen()),
  ];

  void _onTabSelected(int index) {
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: AppBottomNavBar(
        currentIndex: _currentIndex,
        onTabSelected: _onTabSelected,
      ),
    );
  }
}
