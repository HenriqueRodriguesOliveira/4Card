import 'package:flutter/material.dart';

class RecentJobCard extends StatelessWidget {
  final String companyName;
  final String jobTitle;
  final String logoImagePath;
  final String hourlyRate;

  RecentJobCard({
    required this.companyName,
    required this.jobTitle,
    required this.logoImagePath,
    required this.hourlyRate,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Container(
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Color.fromARGB(255, 238, 237, 237)),
            borderRadius: BorderRadius.circular(8)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                height: 62,
                padding: EdgeInsets.all(12),
                color: Color.fromARGB(255, 249, 249, 249),
                child: Image.asset(
                  logoImagePath,
                  color: Color.fromARGB(255, 253, 168, 41),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  jobTitle,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Color.fromARGB(255, 253, 168, 41)),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  companyName,
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
            Text(
              hourlyRate.toString(),
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
