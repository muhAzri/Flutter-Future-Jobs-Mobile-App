import 'package:flutter/material.dart';
import 'package:flutter_future_jobs/models/job_model.dart';
import 'package:flutter_future_jobs/theme.dart';

class DetailPage extends StatefulWidget {
  final JobModel job;
  DetailPage(this.job);

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
            color: Color(0xffECEDF1), borderRadius: BorderRadius.circular(20)),
        child: Text(
          'You have applied this job and the recruiter will contact you immediately',
          textAlign: TextAlign.center,
          style: darkGreyTextStyle,
        ),
      );
    }

    Widget detailItem(String text) {
      return Container(
        margin: EdgeInsets.only(top: 16),
        child: Row(
          children: [
            Image.asset(
              'assets/dot_detail.png',
              width: 12,
            ),
            SizedBox(
              width: 8,
            ),
            Flexible(
              child: Text(
                text,
                style: requirementTextStyle,
              ),
            ),
          ],
        ),
      );
    }

    Widget about() {
      return Container(
        margin: EdgeInsets.only(bottom: 30),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'About the job',
            style: blackTextStyle.copyWith(fontWeight: medium),
          ),
          Column(
              children:
                  widget.job.about.map((text) => detailItem(text)).toList())
        ]),
      );
    }

    Widget qualification() {
      return Container(
        margin: EdgeInsets.only(bottom: 30),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Qualification',
            style: blackTextStyle.copyWith(fontWeight: medium),
          ),
          Column(
              children: widget.job.qualifications
                  .map((text) => detailItem(text))
                  .toList())
        ]),
      );
    }

    Widget responsibilities() {
      return Container(
        margin: EdgeInsets.only(bottom: 30),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Responsibilities',
            style: blackTextStyle.copyWith(fontWeight: medium),
          ),
          Column(
              children: widget.job.responsibilities
                  .map((text) => detailItem(text))
                  .toList())
        ]),
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
                  isApplied ? successAppliedMessages() : SizedBox(),
                  Image.network(
                    widget.job.companyLogo,
                    width: 60,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    widget.job.name,
                    style: blackTextStyle.copyWith(
                        fontWeight: semibold, fontSize: 20),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    '${widget.job.companyName} • ${widget.job.location}',
                    style: greyTextStyle,
                  ),
                ],
              ),
            ),
            //LANJUTAN
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Column(
                children: [about(), qualification(), responsibilities()],
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
