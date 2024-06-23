import 'package:ballotchain/util/constants/color_constants.dart';
import 'package:cupertino_modal_sheet/cupertino_modal_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:ballotchain/widgets/bottom_navigation_bar.dart';
import 'package:ballotchain/widgets/floating_button.dart';
import 'package:ballotchain/widgets/side_bar.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wallet'),
        backgroundColor: ColorConstants.primaryColor,
        foregroundColor: Colors.white,
      ),
      drawer: const SideBar(),
      floatingActionButton: const CustomFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavBar(
        position: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Total Balance',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(16.0),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0XFF03211A),
                    Color(0XFF3C0A0A),
                  ],
                  // stops: [0.75,0.2]
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '10,000 Ballot Points (BP)',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 12),
                  Center(
                      child: ElevatedButton(
                    style: ButtonStyle(
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Adjust the radius as needed
                        ),
                      ),
                    ),
                    onPressed: () {
                      // Add fund wallet logic
                      showCupertinoModalSheet(
                        fullscreenDialog: true,
                        context: context,
                        builder: (context) => const SelectPaymentScreen(),
                      );
                    },
                    child: const Text('Fund Wallet'),
                  )),
                  const SizedBox(height: 12),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Text(
            //   'Vote Points Conversion',
            //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            // ),
            // SizedBox(height: 8),
            // Container(
            //   padding: EdgeInsets.all(16.0),
            //   decoration: BoxDecoration(
            //     color: Colors.grey[200],
            //     borderRadius: BorderRadius.circular(8.0),
            //   ),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Text('100 Ballot Points = 20 Votes'),
            //       Text('500 Ballot Points = 100 Votes'),
            //       Text('2,500 Ballot Points = 500 Votes'),
            //       Text('5,000 Ballot Points = 1,000 Votes'),
            //       Text('25,000 Ballot Points = 5,000 Votes'),
            //       Text('50,000 Ballot Points = 10,000 Votes'),
            //     ],
            //   ),
            // ),
            // SizedBox(height: 16),
            const Text(
              'Recent Activity',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Column(
              children: [
                for (int i = 0; i < 5; i++)
                  i % 2 == 0
                      ? ActivityItem(
                          activity: 'Wallet Funded',
                          points: '+ $i,000 BP',
                        )
                      : ActivityItem(
                          activity: 'Wallet Funded',
                          points:
                              '-$i,000 BP', // Different points for odd items
                        ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Upcoming Activity',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Column(
              children: [
                for (int i = 0; i < 5; i++)
                  i % 2 == 0
                      ? const ActivityItem(
                          activity: 'Wallet Funded',
                          points: '+10,000 BP',
                        )
                      : const ActivityItem(
                          activity: 'Wallet Funded',
                          points: '+10,000 BP',
                        ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BookDetailsScreen extends StatelessWidget {
  const BookDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("card");
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
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: const Color.fromRGBO(255, 193, 7, 0.3)),
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Icon(
                    Icons.compare_arrows,
                    color: Color.fromARGB(255, 193, 7, 7),
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(activity),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    '12:00 AM',
                    style: TextStyle(
                      fontSize: 8,
                    ),
                  )
                ],
              ),
            ],
          ),
          Text(points,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.green,
              )),
        ],
      ),
    );
  }
}

class SelectPaymentScreen extends StatefulWidget {
  const SelectPaymentScreen({super.key});

  @override
  _SelectPaymentScreenState createState() => _SelectPaymentScreenState();
}

class _SelectPaymentScreenState extends State<SelectPaymentScreen> {
  String _selectedPaymentMethod = 'PayStack';

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Select Payment Method'),
        trailing: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(CupertinoIcons.clear_thick),
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildPaymentOption(
                title: 'PayStack',
                value: 'PayStack',
                groupValue: _selectedPaymentMethod,
                onChanged: (value) {
                  setState(() {
                    _selectedPaymentMethod = value!;
                  });
                },
              ),
              const SizedBox(height: 6.0),
              buildPaymentOption(
                title: 'Bitpay',
                value: 'Bitpay',
                groupValue: _selectedPaymentMethod,
                onChanged: (value) {
                  setState(() {
                    _selectedPaymentMethod = value!;
                  });
                },
              ),
              const SizedBox(height: 22.0),
              CupertinoButton.filled(
                child: const Text('Continue'),
                onPressed: () {
                  // Add your continue logic here
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPaymentOption({
    required String title,
    required String value,
    required String groupValue,
    required ValueChanged<String?> onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: Colors.grey[300]!,
        ),
      ),
      child: Row(
        children: [
          Image.asset(
            value == 'PayStack' ? 'assets/paystack.png' : 'assets/bitpay.png',
            height: 24.0,
            width: 24.0,
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
          ),
          Radio<String>(
            value: value,
            groupValue: groupValue,
            onChanged: onChanged,
            activeColor: const Color(0xFF002A5B),
          ),
        ],
      ),
    );
  }
}
