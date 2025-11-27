import 'package:flutter/material.dart';
import 'package:flutter_carlos112mo/features/bookings/presentation/widgets/bookings_header.dart';
import 'package:flutter_carlos112mo/features/bookings/presentation/widgets/bookings_tab_selector.dart';
import 'package:flutter_carlos112mo/features/bookings/presentation/widgets/upcoming_empty_state.dart';
import 'package:flutter_carlos112mo/features/bookings/presentation/widgets/reservation_card.dart';
import 'package:get/get.dart';

import '../../../player/presentation/screens/message_screen.dart';
import '../../../team/presentation/controller/team_controller.dart';

class BookingsScreen extends StatefulWidget {
  const BookingsScreen({super.key});

  @override
  _BookingsScreenState createState() => _BookingsScreenState();
}

class _BookingsScreenState extends State<BookingsScreen> {
  bool isUpcomingSelected = false; 
  final TeamController teamController = Get.find<TeamController>();// Set to false for Past tab by default

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: BookingsHeader(
          location: 'Arequipa, Peru',
          //! <--- Change Via API --->
          assetName: 'assets/images/profile_sample.jpg',
          userName: 'Mr. Raja',
        ),
      ),
      body: Column(
        children: [
          // Header
          Container(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Find Football Fields',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),

          BookingsTabSelector(
            isUpcomingSelected: isUpcomingSelected,
            onChanged: (v) => setState(() => isUpcomingSelected = v),
          ),

          // Content
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: isUpcomingSelected
                  ? _buildUpcomingContent()
                  : _buildPastContent(),
            ),
          ),
        ],
      ),

      // Floating Chat Button
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 16),
        child: 
        
         FloatingActionButton(
              backgroundColor: Colors.teal,
              onPressed: () {
                Get.to(
                  () =>
                      MessageScreen(teamId: teamController.currentTeamId.value, chatId: '',),
                );
              },
              child: Image.asset(
                "assets/images/messageIcon.png",
                height: 30,
                width: 30,
              ),
            ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget _buildUpcomingContent() {
    return Column(children: [UpcomingEmptyState(onFindFields: () {})]);
  }

  Widget _buildPastContent() {
    return Column(
      children: [
        ReservationCard(
          title: 'Urban Futsal Center',
          date: 'September 17, 2025',
          time: '12:00 - 13:00',
          address: '45 Downtown Avenue, Football City',
          amount: '\$120',
          status: 'Past',
        ),
      ],
    );
  }
}
