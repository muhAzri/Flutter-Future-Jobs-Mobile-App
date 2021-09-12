import 'package:flutter/material.dart';
import 'package:flutter_future_jobs/theme.dart';

class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isApplied = false;

  @override
  Widget build(BuildContext context) {
    Widget applyButton() {
      return Center(
        child: Container(
          width: 200,
          height: 45,
          child: TextButton(
              style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(66)),
                  backgroundColor: blueColor),
              onPressed: () {
                setState(() {
                  isApplied = true;
                });
              },
              child: Text(
                'Apply for Job',
                style: whiteTextStyle.copyWith(fontWeight: medium),
              )),
        ),
      );
    }

    Widget cancelButton() {
      return Center(
        child: Container(
          width: 200,
          height: 45,
          child: TextButton(
              style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(66)),
                  backgroundColor: redColor),
              onPressed: () {
                setState(() {
                  isApplied = !isApplied;
                });
              },
              child: Text(
                'Cancel Apply',
                style: whiteTextStyle.copyWith(fontWeight: medium),
              )),
        ),
      );
    }

    Widget successAppliedMessages() {
      return Container(
        width: 312,
        padding: EdgeInsets.fromLTRB(50, 5, 50, 5),
        margin: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: Color(0xffECEDF1),
          borderRadius: BorderRadius.circular(20)
        ),
        child: Text(
          'You have applied this job and the recruiter will contact you immediately',
          textAlign: TextAlign.center,
          style: darkGreyTextStyle,
        ),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 80,
                  ),
                  isApplied ? successAppliedMessages() : SizedBox() ,
                  Image.asset(
                    'assets/company1.png',
                    width: 60,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Front-End Developer',
                    style: blackTextStyle.copyWith(
                        fontWeight: semibold, fontSize: 20),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    'Google, Inc • Jakarta',
                    style: greyTextStyle,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(left: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About the job',
                    style: blackTextStyle.copyWith(fontWeight: medium),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/dot_detail.png',
                        width: 12,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        'Full-Time On Site',
                        style: requirementTextStyle,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/dot_detail.png',
                        width: 12,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        'Start at \$18,000 per month',
                        style: requirementTextStyle,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Qualifications',
                    style: blackTextStyle.copyWith(fontWeight: medium),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/dot_detail.png',
                        width: 12,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Candidate must possess at least a \nBachelor's Degree.",
                        style: requirementTextStyle,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/dot_detail.png',
                        width: 12,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        'Able to use Microsoft Office and Google \nbased service.',
                        style: requirementTextStyle,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/dot_detail.png',
                        width: 12,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        'Have an excellent time management, \ngood at organized and details',
                        style: requirementTextStyle,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Responsibilities',
                    style: blackTextStyle.copyWith(fontWeight: medium),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/dot_detail.png',
                        width: 12,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Initiate and promote any programs, events, \ntraining, or activities..",
                        style: requirementTextStyle,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/dot_detail.png',
                        width: 12,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        'Assessing and anticipating needs and \ncollaborate with Division.',
                        style: requirementTextStyle,
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            //BUTTON
            isApplied ? cancelButton() : applyButton(),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Message Recruiter',
                    style: greyTextStyle.copyWith(
                      fontWeight: light,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 35,
            ),
          ],
        ),
      ),
    );
  }
}
