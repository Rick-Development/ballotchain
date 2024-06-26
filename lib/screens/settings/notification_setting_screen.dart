import 'package:ballotchain/util/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationSettingScreen extends StatefulWidget {
  const NotificationSettingScreen({super.key});

  @override
  State<NotificationSettingScreen> createState() =>
      _NotificationSettingScreenState();
}

class _NotificationSettingScreenState extends State<NotificationSettingScreen> {
  bool emailNotification = false;
  bool inAppNotification = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Notification'),
          backgroundColor: ColorConstants.primaryColor,
          foregroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildNotificationOption(
                title: 'Email notification',
                description: 'Get email notification for all ticket updates',
                value: emailNotification,
                onChanged: (bool newValue) {
                  setState(() {
                    emailNotification = newValue;
                  });
                },
              ),
              const SizedBox(height: 24.0),
              buildNotificationOption(
                title: 'In-app notification',
                description: 'Get in-app notification for all ticket updates',
                value: inAppNotification,
                onChanged: (bool newValue) {
                  setState(() {
                    inAppNotification = newValue;
                  });
                },
              ),
            ],
          ),
        ));
  }

  Widget buildNotificationOption({
    required String title,
    required String description,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.inter(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: ColorConstants.textBlue,
              ),
            ),
            const SizedBox(height: 4.0),
            Text(
              description,
              style: GoogleFonts.inter(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: ColorConstants.textBlue2,
              ),
            ),
          ],
        ),
        Switch(
          value: value,
          onChanged: onChanged,
          activeColor: const Color(0xFF002A5B),
        ),
      ],
    );
  }
}
