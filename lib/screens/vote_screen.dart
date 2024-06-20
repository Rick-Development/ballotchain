import 'package:flutter/material.dart';

import 'package:ballotchain/util/api_url.dart';
import 'package:ballotchain/util/app_constant.dart';
import 'package:ballotchain/widgets/bottom_navigation_bar.dart';
import 'package:ballotchain/widgets/floating_button.dart';
import 'package:ballotchain/widgets/side_bar.dart';

class VoteScreen extends StatefulWidget {
  const VoteScreen({super.key});

  @override
  State<VoteScreen> createState() => _VoteScreenState();
}

class _VoteScreenState extends State<VoteScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Vote'),
          backgroundColor: AppConstants.primaryColor,
          foregroundColor: Colors.white,
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                child: Text(
                  "Ongoing",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  "Upcoming",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  "Closed",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  "History",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        drawer: SideBar(),
        bottomNavigationBar: BottomNavBar(position: 1),
        floatingActionButton: const CustomFloatingButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: TabBarView(
          children: <Widget>[
            OngoingVoteListWidget(),
            UpcomingVoteListWidget(),
            ClosedVoteListWidget(),
            VoteHistoryListWidget(),
          ],
        ),
      ),
    );
  }
}

class VoteItem {
  final String title;
  final String category;
  final String startDate;
  final String endDate;
  final int nominees;

  VoteItem({
    required this.title,
    required this.category,
    required this.startDate,
    required this.endDate,
    required this.nominees,
  });
}

class OngoingVoteListWidget extends StatelessWidget {
  final List<VoteItem> votes = [
    VoteItem(
      title: 'AMMA Awards',
      category: 'Movie Award',
      startDate: 'Jan-29-2024',
      endDate: 'Jan-29-2024',
      nominees: 7,
    ),
    VoteItem(
      title: 'BBnaija Voting',
      category: 'TV Show',
      startDate: 'Jan-29-2024',
      endDate: 'Jan-29-2024',
      nominees: 12,
    ),
    VoteItem(
      title: 'Headies Award',
      category: 'Music Award',
      startDate: 'Jan-29-2024',
      endDate: 'Jan-29-2024',
      nominees: 21,
    ),
    VoteItem(
      title: 'FUTA SUG voting',
      category: 'University',
      startDate: 'Jan-29-2024',
      endDate: 'Jan-29-2024',
      nominees: 14,
    ),
    VoteItem(
      title: 'Comedy Awards',
      category: 'Comedy Award',
      startDate: 'Jan-29-2024',
      endDate: 'Jan-29-2024',
      nominees: 29,
    ),
  ];

  OngoingVoteListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: votes.length,
      itemBuilder: (context, index) {
        final vote = votes[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 5.0),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Image.network(
                  ApiUrl.profileUrl, // Replace with your asset images
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        vote.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text('Category: ${vote.category}'),
                      Text('Start Date: ${vote.startDate}'),
                      Text('End Date: ${vote.endDate}'),
                    ],
                  ),
                ),
                Column(
                  children: [
                    const Text('Nominees'),
                    Text('${vote.nominees}'),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        // Add vote handling code here
                      },
                      child: const Text('Vote Now'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class UpcomingVoteListWidget extends StatelessWidget {
  final List<VoteItem> votes = [
    VoteItem(
      title: 'AMMA Awards',
      category: 'Movie Award',
      startDate: 'Jan-29-2024',
      endDate: 'Jan-29-2024',
      nominees: 7,
    ),
    VoteItem(
      title: 'BBnaija Voting',
      category: 'TV Show',
      startDate: 'Jan-29-2024',
      endDate: 'Jan-29-2024',
      nominees: 12,
    ),
    VoteItem(
      title: 'Headies Award',
      category: 'Music Award',
      startDate: 'Jan-29-2024',
      endDate: 'Jan-29-2024',
      nominees: 7,
    ),
    VoteItem(
      title: 'FUTA SUG voting',
      category: 'University',
      startDate: 'Jan-29-2024',
      endDate: 'Jan-29-2024',
      nominees: 7,
    ),
    VoteItem(
      title: 'Comedy Awards',
      category: 'Comedy Award',
      startDate: 'Jan-29-2024',
      endDate: 'Jan-29-2024',
      nominees: 7,
    ),
  ];

  UpcomingVoteListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: votes.length,
      itemBuilder: (context, index) {
        final vote = votes[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 5.0),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Image.network(
                  ApiUrl.profileUrl, // Replace with your asset images
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        vote.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text('Category: ${vote.category}'),
                      Text('Start Date: ${vote.startDate}'),
                      Text('End Date: ${vote.endDate}'),
                    ],
                  ),
                ),
                Column(
                  children: [
                    const Text('Nominees'),
                    Text('${vote.nominees}'),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.grey[200], // Text color
                        side: const BorderSide(
                            color: Colors.grey), // Border color
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(10), // Rounded corners
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                      ),
                      onPressed: () {
                        // Add vote handling code here
                      },
                      child: const Text('Vote Now'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ClosedVoteListWidget extends StatelessWidget {
  final List<VoteItem> votes = [
    VoteItem(
      title: 'AMMA Awards',
      category: 'Movie Award',
      startDate: 'Jan-29-2024',
      endDate: 'Jan-29-2024',
      nominees: 7,
    ),
    VoteItem(
      title: 'BBnaija Voting',
      category: 'TV Show',
      startDate: 'Jan-29-2024',
      endDate: 'Jan-29-2024',
      nominees: 12,
    ),
    VoteItem(
      title: 'Headies Award',
      category: 'Music Award',
      startDate: 'Jan-29-2024',
      endDate: 'Jan-29-2024',
      nominees: 21,
    ),
    VoteItem(
      title: 'FUTA SUG voting',
      category: 'University',
      startDate: 'Jan-29-2024',
      endDate: 'Jan-29-2024',
      nominees: 14,
    ),
    VoteItem(
      title: 'Comedy Awards',
      category: 'Comedy Award',
      startDate: 'Jan-29-2024',
      endDate: 'Jan-29-2024',
      nominees: 29,
    ),
  ];

  ClosedVoteListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: votes.length,
      itemBuilder: (context, index) {
        final vote = votes[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 5.0),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Image.network(
                  ApiUrl.profileUrl, // Replace with your asset images
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        vote.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text('Category: ${vote.category}'),
                      Text('Start Date: ${vote.startDate}'),
                      Text('End Date: ${vote.endDate}'),
                    ],
                  ),
                ),
                Column(
                  children: [
                    const Text('Nominees'),
                    Text('${vote.nominees}'),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        // Add vote handling code here
                      },
                      child: const Text('Vote Now'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class VoteItem2 {
  final String category;
  final String awardCategory;
  final String candidateVoted;
  final String date;
  final String voteID;
  final String voteStatus;

  VoteItem2({
    required this.category,
    required this.awardCategory,
    required this.candidateVoted,
    required this.date,
    required this.voteID,
    required this.voteStatus,
  });
}

class VoteHistoryListWidget extends StatelessWidget {
  final List<VoteItem2> votes = [
    VoteItem2(
      category: 'Music Award',
      awardCategory: 'Best Album',
      candidateVoted: 'Timeless (Davido)',
      date: '12/01/2024',
      voteID: '20192083291',
      voteStatus: 'Confirmed',
    ),
    VoteItem2(
      category: 'Music Award',
      awardCategory: 'Best Album',
      candidateVoted: 'Timeless (Davido)',
      date: '12/01/2024',
      voteID: '20192083291',
      voteStatus: 'Pending',
    ),
    VoteItem2(
      category: 'Music Award',
      awardCategory: 'Best Album',
      candidateVoted: 'Timeless (Davido)',
      date: '12/01/2024',
      voteID: '20192083291',
      voteStatus: 'Pending',
    ),
    VoteItem2(
      category: 'Music Award',
      awardCategory: 'Best Album',
      candidateVoted: 'Timeless (Davido)',
      date: '12/01/2024',
      voteID: '20192083291',
      voteStatus: 'Failed',
    ),
    VoteItem2(
      category: 'Music Award',
      awardCategory: 'Best Album',
      candidateVoted: 'Timeless (Davido)',
      date: '12/01/2024',
      voteID: '20192083291',
      voteStatus: 'Confirmed',
    ),
  ];

  VoteHistoryListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: votes.length,
      itemBuilder: (context, index) {
        final vote = votes[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 5.0),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Image.network(
                  ApiUrl.profileUrl, // Replace with your asset images
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Category: ${vote.category}'),
                      Text('Award Category: ${vote.awardCategory}'),
                      Text('Candidate Voted: ${vote.candidateVoted}'),
                      Text('Date: ${vote.date}'),
                      Text('Vote ID: ${vote.voteID}'),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Text(
                      vote.voteStatus,
                      style: TextStyle(
                        color: getStatusColor(vote.voteStatus),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextButton(
                      onPressed: () {
                        // Add view on BallotChain scan handling code here
                      },
                      child: const Text(
                        'View on BallotChain Scan',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Color getStatusColor(String status) {
    switch (status) {
      case 'Confirmed':
        return Colors.green;
      case 'Pending':
        return Colors.orange;
      case 'Failed':
        return Colors.red;
      default:
        return Colors.black;
    }
  }
}
