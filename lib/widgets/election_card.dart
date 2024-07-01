import 'package:ballotchain/util/constants/color_constants.dart';
import 'package:flutter/material.dart';

class ElectionCard extends StatelessWidget {
  final String imageUrl;
  final String electionTitle;
  final String date;

  const ElectionCard(
      {super.key,
      required this.imageUrl,
      required this.electionTitle,
      required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      width: 294,
      height: 221,
      decoration: BoxDecoration(
        // color: Colors.grey[200],
        image: DecorationImage(
          image: AssetImage(imageUrl),
          fit: BoxFit.cover,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
        color: Colors.red,
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          // height: 108,
          width: 294,
          padding: const EdgeInsets.all(14),
          decoration: const BoxDecoration(
            color: Color.fromRGBO(0, 0, 0, 0.85),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                electionTitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: ColorConstants.textGrey3,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                date,
                style: TextStyle(
                  fontSize: 14,
                  color: ColorConstants.whiteColor,
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 30,
                  width: 90,
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  decoration: BoxDecoration(
                    color: ColorConstants.mainColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Center(
                    child: Text(
                      "Vote Now",
                      style: TextStyle(
                        fontSize: 12,
                        color: ColorConstants.whiteColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
