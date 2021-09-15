import 'package:flutter/material.dart';
import 'package:flutter_future_jobs/models/job_model.dart';
import 'package:flutter_future_jobs/pages/detail_page.dart';
import 'package:flutter_future_jobs/theme.dart';

class CustomList extends StatelessWidget {
  final JobModel job;
  CustomList(this.job);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailPage(job),
              ));
        },
        child: Column(
          children: [
            Row(
              children: [
                Image.network(
                  job.companyLogo,
                  width: 45,
                ),
                SizedBox(
                  width: 27,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        job.name,
                        style: blackTextStyle.copyWith(
                            fontWeight: medium, fontSize: 16),
                      ),
                      SizedBox(height: 2),
                      Text(job.companyName, style: greyTextStyle),
                      Divider(
                        color: lightGrey,
                        thickness: 1.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16)
          ],
        ),
      ),
    );
  }
}
