import 'package:ballotchain/widgets/floating_button.dart';
import 'package:ballotchain/widgets/side_bar.dart';
import 'package:card_loading/card_loading.dart';
import 'package:flutter/material.dart';
import '../util/api_url.dart';
import '../util/app_constant.dart';
import '../widgets/bottom_navigation_bar.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BallotChain',
        ),
        backgroundColor: AppConstants.primaryColor,
        foregroundColor: Colors.white,
        // foregroundColor: AppConstants.whiteColor,
      ),
      drawer: const SideBar(),
      bottomNavigationBar: BottomNavBar(
        position: 0,
      ),
      floatingActionButton: const CustomFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Hi Mikel O',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Welcome back',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              color: Colors.grey[300],
              child: Image.network(ApiUrl.testImageUrl1),
              // child: Text(
              //   'Naija Beats Election 2024: Top Contenders Emerge as Music Icons Vie for Entertainment Crown',
              //   style: TextStyle(fontSize: 16),
              // ),
            ),
            const CardLoading(
              height: 15,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              margin: EdgeInsets.only(bottom: 10),
              cardLoadingTheme: CardLoadingTheme.defaultTheme,
            ),
            const SizedBox(height: 16),
            const Text(
              'Featured Elections',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  // Image.network(ApiUrl.testImageUrl3,height: 150,),
                  // Image.network(ApiUrl.testImageUrl2,height: 150,),
                  // Image.network(ApiUrl.testImageUrl3,height: 150,),
                  ElectionCard(
                    image_url: ApiUrl.testImageUrl3,
                    date: 'Jan 26, 2024',
                  ),
                  ElectionCard(
                    image_url: ApiUrl.testImageUrl2,
                    date: 'Jan 26, 2024',
                  ),
                  ElectionCard(
                    image_url: ApiUrl.testImageUrl3,
                    date: 'Jan 26, 2024',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Popular Category',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ElectionCard(
                    image_url: ApiUrl.testImageUrl2,
                    date: 'Jan 26, 2024',
                  ),
                  ElectionCard(
                    image_url: ApiUrl.testImageUrl3,
                    date: 'Jan 26, 2024',
                  ),
                  ElectionCard(
                    image_url: ApiUrl.testImageUrl2,
                    date: 'Jan 26, 2024',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const RecentActivitySection(),
          ],
        ),
      ),
    );
  }
}

class ElectionCard extends StatelessWidget {
  final String image_url;
  final String date;

  const ElectionCard({super.key, required this.image_url, required this.date});

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
            image_url,
            height: 100,
          ),
          // Text(
          //   image_url,
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

class RecentActivitySection extends StatelessWidget {
  const RecentActivitySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.grey[200],
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recent Activity',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          ActivityItem(
            activity: 'Wallet Funded',
            points: '+1000 BP',
          ),
          ActivityItem(
            activity: 'Voted',
            points: '-500 BP',
          ),
          ActivityItem(
            activity: 'Wallet Funded',
            points: '+1500 BP',
          ),
        ],
      ),
    );
  }
}

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
