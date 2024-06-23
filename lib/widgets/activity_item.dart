import 'package:flutter/material.dart';

class ActivityItem extends StatelessWidget {
  final String activity;
  final String points;

  const ActivityItem({super.key, required this.activity, required this.points});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(activity),
          Text(points, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
