import 'package:ballotchain/screens/notification_setting_screen.dart';
import 'package:ballotchain/screens/profile_screen.dart';
import 'package:ballotchain/screens/security_screen.dart';
import 'package:ballotchain/util/api_url.dart';
import 'package:flutter/material.dart';
import '../util/app_constant.dart';
import '../widgets/bottom_navigation_bar.dart';
import '../widgets/floating_button.dart';
import '../widgets/side_bar.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: AppConstants.primaryColor,
        foregroundColor: Colors.white,
      ),
      drawer: SideBar(),
      bottomNavigationBar: BottomNavBar(
        position: 3,
      ),
      floatingActionButton: const CustomFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const ProfileSection(),
          const SizedBox(height: 36),
          // AccountSection(),
          // SizedBox(height: 16),
          const SettingsSection(),
          const SizedBox(height: 16),
          Center(
            child: TextButton(
              onPressed: () {
                // Add delete account logic
              },
              child: const Text(
                'Log out',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      height: MediaQuery.of(context).size.height * 0.15,
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(ApiUrl.profileUrl),
          ),
          const SizedBox(width: 16),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Rick De Programmer',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '@rickdeprogrammer',
                style: TextStyle(color: Colors.white70),
              ),
            ],
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.white),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProfileScreen()));
              // Edit profile logic
            },
          ),
        ],
      ),
    );
  }
}

class AccountSection extends StatelessWidget {
  const AccountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ListTile(
        leading: const Icon(Icons.person, color: Colors.white),
        title: const Text(
          'Personal Details',
          style: TextStyle(color: Colors.white),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const PersonalDetailsScreen()),
          );
        },
      ),
    );
  }
}

class SettingsSection extends StatelessWidget {
  const SettingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 56.0),
        ListTile(
          leading: const Icon(Icons.person, color: Colors.black),
          title: const Text('Profile', style: TextStyle(color: Colors.black)),
          trailing: const Icon(Icons.arrow_forward_ios, color: Colors.black),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfileScreen()),
            );
          },
        ),
        const SizedBox(height: 16.0),
        ListTile(
          leading: const Icon(Icons.security, color: Colors.black),
          title: const Text('Security', style: TextStyle(color: Colors.black)),
          trailing: const Icon(Icons.arrow_forward_ios, color: Colors.black),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SecurityScreen()),
            );
          },
        ),
        const SizedBox(height: 16.0),
        ListTile(
          leading: const Icon(Icons.notifications, color: Colors.black),
          title:
              const Text('Notification', style: TextStyle(color: Colors.black)),
          trailing: const Icon(Icons.arrow_forward_ios, color: Colors.black),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const NotificationSettingScreen()),
            );
          },
        ),
        const SizedBox(height: 16.0),
        ListTile(
          leading: const Icon(Icons.help, color: Colors.black),
          title: const Text('Help & Support',
              style: TextStyle(color: Colors.black)),
          trailing: const Icon(Icons.arrow_forward_ios, color: Colors.black),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const HelpSupportScreen()),
            );
          },
        ),
      ],
    );
  }
}

class PersonalDetailsScreen extends StatelessWidget {
  const PersonalDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Details'),
        backgroundColor: AppConstants.primaryColor,
        foregroundColor: Colors.white,
      ),
      body: const Center(child: Text('Personal Details Screen')),
    );
  }
}

class SecuritySection extends StatelessWidget {
  const SecuritySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Security'),
        backgroundColor: AppConstants.primaryColor,
        foregroundColor: Colors.white,
      ),
      body: const Center(child: Text('Security Screen')),
    );
  }
}

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Language'),
        backgroundColor: AppConstants.primaryColor,
        foregroundColor: Colors.white,
      ),
      body: const Center(child: Text('Language Screen')),
    );
  }
}

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification'),
        backgroundColor: AppConstants.primaryColor,
        foregroundColor: Colors.white,
      ),
      body: const Center(child: Text('Notification Screen')),
    );
  }
}

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help & Support'),
        backgroundColor: AppConstants.primaryColor,
        foregroundColor: Colors.black,
      ),
      body: const Center(child: Text('Help & Support Screen')),
    );
  }
}
