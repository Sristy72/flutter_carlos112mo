import 'package:flutter/material.dart';

class BookingsHeader extends StatelessWidget {
  final String location;
  final String avatarUrl;

  const BookingsHeader({
    Key? key,
    required this.location,
    required this.avatarUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                location,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 2),
              Icon(Icons.location_on, size: 16),
            ],
          ),
          CircleAvatar(radius: 18, backgroundImage: NetworkImage(avatarUrl)),
        ],
      ),
      elevation: 0,
    );
  }
}
