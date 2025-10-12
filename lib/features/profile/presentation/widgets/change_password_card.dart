import 'package:flutter/material.dart';

class ChangePasswordCard extends StatelessWidget {
  final String currentPassword;
  final ValueChanged<String> onCurrentPasswordChanged;
  final String newPassword;
  final ValueChanged<String> onNewPasswordChanged;
  final String confirmPassword;
  final ValueChanged<String> onConfirmPasswordChanged;

  const ChangePasswordCard({
    Key? key,
    required this.currentPassword,
    required this.onCurrentPasswordChanged,
    required this.newPassword,
    required this.onNewPasswordChanged,
    required this.confirmPassword,
    required this.onConfirmPasswordChanged,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Change Password'),

            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 24.0, bottom: 8.0),
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
              onChanged: onCurrentPasswordChanged,
            ),

            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 24.0, bottom: 8.0),
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
              onChanged: onNewPasswordChanged,
            ),

            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 24.0, bottom: 8.0),
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
              onChanged: onConfirmPasswordChanged,
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
                  // handle update in parent
                },
                child: Text('Update Password'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
