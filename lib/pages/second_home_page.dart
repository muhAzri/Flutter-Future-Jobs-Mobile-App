import 'package:flutter/material.dart';
import 'package:flutter_future_jobs/theme.dart';
import 'package:flutter_future_jobs/widgets/custom_list.dart';

class SecondHomePage extends StatelessWidget {
  final String jobTitleHome;
  final String imageurl;

  SecondHomePage({
    required this.jobTitleHome, 
    required this.imageurl
    });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      width: double.infinity,
                      height: 320,
                      child: Image.asset(
                        imageurl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 200, left: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          jobTitleHome,
                          style: whiteTextStyle.copyWith(
                              fontWeight: semibold, fontSize: 24),
                        ),
                        Text(
                          '12,309 available',
                          style: whiteTextStyle.copyWith(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 24),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Big Companies',
                        style: blackTextStyle.copyWith(fontSize: 16),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Column(
                        children: [
                          CustomList(
                              imageurl: 'assets/company1.png',
                              jobTitle: 'Front-End Developer',
                              company: 'Google'),
                          CustomList(
                              imageurl: 'assets/company2.png',
                              jobTitle: 'UI Designer',
                              company: 'Instagram'),
                          CustomList(
                              imageurl: 'assets/company3.png',
                              jobTitle: 'Data Scientist',
                              company: 'Facebook'),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.5, left: 24),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'New Startups',
                        style: blackTextStyle.copyWith(fontSize: 16),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Column(
                        children: [
                          CustomList(
                              imageurl: 'assets/company1.png',
                              jobTitle: 'Front-End Developer',
                              company: 'Google'),
                          CustomList(
                              imageurl: 'assets/company2.png',
                              jobTitle: 'UI Designer',
                              company: 'Instagram'),
                          CustomList(
                              imageurl: 'assets/company3.png',
                              jobTitle: 'Data Scientist',
                              company: 'Facebook'),
                        ],
                      )
                    ],
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
