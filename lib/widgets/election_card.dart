import 'package:flutter/material.dart';

class ElectionCard extends StatelessWidget {
  final String imageUrl;
  final String date;

  const ElectionCard({super.key, required this.imageUrl, required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      width: 160,
      height: 100,
      color: Colors.grey[200],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            imageUrl,
            height: 100,
          ),
          // Text(
          //   imageUrl,
          //   textAlign: TextAlign.center,
          //   style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          // ),
          // SizedBox(height: 8),
          // Text(
          //   date,
          //   style: TextStyle(fontSize: 12),
          // ),
        ],
      ),
    );
  }
}
