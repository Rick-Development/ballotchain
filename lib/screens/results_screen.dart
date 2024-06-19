import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../util/app_constant.dart';
import '../widgets/bottom_navigation_bar.dart';
import '../widgets/floating_button.dart';
import '../widgets/side_bar.dart';

class ResultScreen extends StatefulWidget {
  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Results'),
        backgroundColor: AppConstants.primaryColor,
        foregroundColor: Colors.white,
      ),
      drawer: SideBar(),
      bottomNavigationBar: BottomNavBar(position: 2,),
      floatingActionButton: CustomFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              'Filter By',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            // Add filter widget here
            SizedBox(height: 16),
            Text(
              'Vote: Movie Awards',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            buildVoteChartCard(
              title: 'Best Actor Vote Chart',
              totalVotes: '600 total',
              votes: '230',
              category: 'Best Actor',
              status: 'Completed',
              startDate: '01/02/2024',
              endDate: '10/02/2024',
              candidates: [
                'Ramsey Noah',
                'Omari Oboli',
                'Nkechi Blessing',
                'Alex Unusual',
                'Sola Sobowale',
                'Funke Akindele'
              ],
            ),
            SizedBox(height: 16),
            buildVoteChartCard(
              title: 'Best Movie Vote Chart',
              totalVotes: '600 total',
              votes: '230',
              category: 'Best Actor',
              status: 'Completed',
              startDate: '01/02/2024',
              endDate: '10/02/2024',
              candidates: [
                'Ramsey Noah',
                'Omari Oboli',
                'Nkechi Blessing',
                'Alex Unusual',
                'Sola Sobowale',
                'Funke Akindele'
              ],
            ),
            SizedBox(height: 16),
            buildVoteChartCard(
              title: 'Best Lead Role Vote Chart',
              totalVotes: '600 total',
              votes: '230',
              category: 'Best Actor',
              status: 'Completed',
              startDate: '01/02/2024',
              endDate: '10/02/2024',
              candidates: [
                'Ramsey Noah',
                'Omari Oboli',
                'Nkechi Blessing',
                'Alex Unusual',
                'Sola Sobowale',
                'Funke Akindele'
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildVoteChartCard({
    required String title,
    required String totalVotes,
    required String votes,
    required String category,
    required String status,
    required String startDate,
    required String endDate,
    required List<String> candidates,
  }) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(totalVotes),
            SizedBox(height: 8),
            Container(
              height: 200,
              child: BarChart(
                BarChartData(
                  barGroups: [
                    BarChartGroupData(
                      x: 0,
                      barRods: [BarChartRodData(toY: 50, color: Colors.blue)],
                    ),
                    BarChartGroupData(
                      x: 1,
                      barRods: [BarChartRodData(toY: 30, color: Colors.blue)],
                    ),
                    BarChartGroupData(
                      x: 2,
                      barRods: [BarChartRodData(toY: 70, color: Colors.blue)],
                    ),
                    BarChartGroupData(
                      x: 3,
                      barRods: [BarChartRodData(toY: 100, color: Colors.blue)],
                    ),
                    BarChartGroupData(
                      x: 4,
                      barRods: [BarChartRodData(toY: 20, color: Colors.blue)],
                    ),
                    BarChartGroupData(
                      x: 5,
                      barRods: [BarChartRodData(toY: 90, color: Colors.blue)],
                    ),
                  ],
                  borderData: FlBorderData(show: false),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: true),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: true),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 8),
            Text('Category: $category'),
            Text('Vote Status: $status'),
            Text('Start Date: $startDate'),
            Text('End Date: $endDate'),
            SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: candidates
                  .map((candidate) => Text(candidate))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}