import 'package:flutter/material.dart';
import 'package:flutter_carlos112mo/core/theme/app_colors.dart';

class PersonalInfoCard extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final String position;
  final ValueChanged<String> onPositionChanged;
  final String age;
  final ValueChanged<String> onAgeChanged;
  final String favoriteClubs;
  final ValueChanged<String> onFavoriteClubsChanged;

  const PersonalInfoCard({
    Key? key,
    required this.formKey,
    required this.position,
    required this.onPositionChanged,
    required this.age,
    required this.onAgeChanged,
    required this.favoriteClubs,
    required this.onFavoriteClubsChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/profile_sample.jpg'),
            ),
            SizedBox(height: 8),
            Text('Profile completion'),
            Text('75%'),
            Text('Mr. Raja'),

            // Position label and field
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 24.0, bottom: 8.0),
                child: Text('Position'),
              ),
            ),
            DropdownButtonFormField<String>(
              initialValue: position,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
              ),
              items: ['Goalkeeper', 'Defender', 'Midfielder', 'Forward']
                  .map(
                    (label) =>
                        DropdownMenuItem(child: Text(label), value: label),
                  )
                  .toList(),
              onChanged: (value) {
                if (value != null) onPositionChanged(value);
              },
            ),

            // Age label and field
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 24.0, bottom: 8.0),
                child: Text('Age'),
              ),
            ),
            TextFormField(
              initialValue: age,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 14,
                ),
              ),
              keyboardType: TextInputType.number,
              onChanged: onAgeChanged,
            ),

            // Favorite Clubs label and field
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 24.0, bottom: 8.0),
                child: Text('Favorite Clubs'),
              ),
            ),
            TextFormField(
              initialValue: favoriteClubs,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 14,
                ),
              ),
              onChanged: onFavoriteClubsChanged,
            ),

            // Location label and field
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 12.0, bottom: 8.0),
                child: Text('Location'),
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 14,
                ),
              ),
              initialValue: 'Arequipa, Peru',
              enabled: false,
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
                  if (formKey.currentState?.validate() ?? false) {
                    // parent will manage save
                  }
                },
                child: Text('Save Changes'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
