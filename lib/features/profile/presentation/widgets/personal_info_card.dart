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
            Row(
              children: [
                Spacer(),
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/profile_sample.jpg'),
                ),
                SizedBox(width: 8),

                Column(
                  children: [
                    Text('Profile completion',),
                    SizedBox(height: 8),
                    Container(
                      width: 60,
                      height: 38,
                      decoration: BoxDecoration(
                        color: AppColors.primaryGreen,
                        borderRadius: BorderRadius.circular(8),
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
            Text('Mr. Raja', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),

            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 24.0, bottom: 8.0),
                child: Text('Full Name'),
              ),
            ),
            TextFormField(
              initialValue: 'Mr. Raja',
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 14,
                ),
              ),
              onChanged: onAgeChanged,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 24.0, bottom: 8.0),
                child: Text('Phone Number'),
              ),
            ),
            TextFormField(
              initialValue: "022 22 13 45",
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
                        DropdownMenuItem(value: label, child: Text(label)),
                  )
                  .toList(),
              onChanged: (value) {
                if (value != null) onPositionChanged(value);
              },
            ),

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
                suffixIcon: Icon(Icons.my_location),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 14,
                ),
              ),
              initialValue: 'Arequipa, Peru',

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
