import 'package:flutter/material.dart';
import 'package:flutter_carlos112mo/core/theme/app_colors.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  String _position = 'Goalkeeper';
  String _age = '20';
  String _favoriteClubs = 'FC Barcelona, Real Madrid, etc.';
  String _currentPassword = '';
  String _newPassword = '';
  String _confirmPassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Arequipa, Peru'),
            CircleAvatar(
              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('My Profile'),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          // Handle edit action
                        });
                      },
                      child: Text('Edit'),
                    ),
                  ],
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(
                            'https://via.placeholder.com/150',
                          ),
                        ),
                        Text('Profile completion'),
                        Text('75%'),
                        Text('Mr. Raja'),
                        // Position label and field
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text('Position'),
                          ),
                        ),
                        DropdownButtonFormField<String>(
                          value: _position,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 12,
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
                                      child: Text(label),
                                      value: label,
                                    ),
                                  )
                                  .toList(),
                          onChanged: (value) {
                            setState(() {
                              _position = value!;
                            });
                          },
                        ),
                        // Age label and field
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 12.0, bottom: 8.0),
                            child: Text('Age'),
                          ),
                        ),
                        TextFormField(
                          initialValue: _age,
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
                          onChanged: (value) {
                            setState(() {
                              _age = value;
                            });
                          },
                        ),
                        // Favorite Clubs label and field
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 12.0, bottom: 8.0),
                            child: Text('Favorite Clubs'),
                          ),
                        ),
                        TextFormField(
                          initialValue: _favoriteClubs,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 14,
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              _favoriteClubs = value;
                            });
                          },
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
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                12,
                              ), // <-- radius here
                            ),
                          ),

                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // Handle save changes
                            }
                          },
                          child: Text('Save Changes'),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Change Password'),
                        // Current Password label and field
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                            child: Text('Current Password'),
                          ),
                        ),
                        TextFormField(
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
                          onChanged: (value) {
                            setState(() {
                              _currentPassword = value;
                            });
                          },
                        ),
                        // New Password label and field
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 12.0, bottom: 8.0),
                            child: Text('New Password'),
                          ),
                        ),
                        TextFormField(
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
                          onChanged: (value) {
                            setState(() {
                              _newPassword = value;
                            });
                          },
                        ),
                        // Confirm New Password label and field
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 12.0, bottom: 8.0),
                            child: Text('Confirm New Password'),
                          ),
                        ),
                        TextFormField(
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
                          onChanged: (value) {
                            setState(() {
                              _confirmPassword = value;
                            });
                          },
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Handle password update
                          },
                          child: Text('Update Password'),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.logoutRed,
                  ),
                  onPressed: () {
                    // Handle logout
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Icon(Icons.exit_to_app), Text('Logout')],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
