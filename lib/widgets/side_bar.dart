import 'package:ballotchain/util/constants/color_constants.dart';
import 'package:flutter/material.dart';

import 'package:ballotchain/screens/dashboard.dart';
import 'package:ballotchain/screens/results_screen.dart';
import 'package:ballotchain/screens/settings_screen.dart';
import 'package:ballotchain/screens/vote_screen.dart';
import 'package:ballotchain/screens/wallet_screen.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: ColorConstants.primaryColor,
            ),
            accountName: const Text('Mikel O'),
            accountEmail: const Text('mikel.o@example.com'),
            currentAccountPicture: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Text('M'),
            ),
          ),
          ListTile(
            title: const Text('Overview'),
            leading: const Icon(Icons.dashboard),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DashboardScreen()));
            },
          ),
          ListTile(
            title: const Text('Vote'),
            leading: const Icon(Icons.how_to_vote),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const VoteScreen()),
              );
            },
          ),
          ListTile(
            title: const Text('Result'),
            leading: const Icon(Icons.bar_chart),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ResultScreen()),
              );
            },
          ),
          ListTile(
            title: const Text('My Wallet'),
            leading: const Icon(Icons.account_balance_wallet),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const WalletScreen()),
              );
            },
          ),
          ListTile(
            title: const Text('Vote Conversion'),
            leading: const Icon(Icons.add_chart_outlined),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Settings'),
            leading: const Icon(Icons.settings),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              );
            },
          ),
          ListTile(
            title: const Text('Log out'),
            leading: const Icon(Icons.logout),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
