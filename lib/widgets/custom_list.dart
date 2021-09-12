import 'package:flutter/material.dart';
import 'package:flutter_future_jobs/pages/detail_page.dart';
import 'package:flutter_future_jobs/theme.dart';

class CustomList extends StatelessWidget {
  final String imageurl;
  final String jobTitle;
  final String company;

  CustomList({
    required this.imageurl,
    required this.jobTitle,
    required this.company,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap:() { Navigator.push(
          context, MaterialPageRoute(
            builder: (context) => DetailPage()
            )
          );
        },
        child: Row(
          children: [
            Image.asset(
              imageurl,
              width: 45,
            ),
            SizedBox(
              width: 27,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  jobTitle,
                  style:
                      blackTextStyle.copyWith(fontWeight: medium, fontSize: 16),
                ),
                SizedBox(height: 2),
                Text(company, style: greyTextStyle),
                Divider(
                    color: greyColor,
                    thickness: 1.0,
                  ),
      
              ],
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
      
    );
  }
}
