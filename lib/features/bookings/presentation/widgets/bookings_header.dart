import 'package:flutter/material.dart';

class BookingsHeader extends StatelessWidget {
  final String location;
  final String assetName;
  final String userName;

  const BookingsHeader({
    super.key,
    required this.location,
    required this.assetName,
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                location,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              SizedBox(width: 4),
              Image(
                image: AssetImage("assets/images/location_icon.png"),
                height: 15,
                width: 15,
              ),
            ],
          ),
          Row(
            children: [
              Text(userName, style: TextStyle(fontSize: 18)),
              SizedBox(width: 8),
              CircleAvatar(
                radius: 17,
                backgroundImage: AssetImage(assetName),
              ),
            ],
          ),
        ],
      ),
      elevation: 0,
    );
  }
}
