import 'package:flutter/material.dart';
import 'package:flutter_future_jobs/models/category_model.dart';
import 'package:flutter_future_jobs/models/job_model.dart';
import 'package:flutter_future_jobs/provider/category_provider.dart';
import 'package:flutter_future_jobs/provider/job_provider.dart';
import 'package:flutter_future_jobs/provider/user_provider.dart';
import 'package:flutter_future_jobs/theme.dart';
import 'package:flutter_future_jobs/widgets/category_card.dart';
import 'package:flutter_future_jobs/widgets/custom_list.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
    var categoryProvider = Provider.of<CategoryProvider>(context);
    var jobProvider = Provider.of<JobProvider>(context);

    Widget header() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
        child: Container(
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Howdy',
                    style: greyTextStyle.copyWith(fontSize: 16),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    userProvider.user.name,
                    style: blackTextStyle.copyWith(
                        fontWeight: semibold, fontSize: 24),
                  )
                ],
              ),
              Spacer(),
              Image.asset(
                'assets/user_pic.png',
                width: 58,
              )
            ],
          ),
        ),
      );
    }

    Widget body() {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                'Hot Categories',
                style: blackTextStyle.copyWith(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            FutureBuilder<List<CategoryModel>>(
                future: categoryProvider.getCategories(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    int index = -1;

                    return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                            children: snapshot.data.map<Widget>((category) {
                          index++;

                          return Container(
                            margin: EdgeInsets.only(left: index == 0 ? 16 : 0),
                            child: CategoryCard(category)
                          );
                        }).toList()));
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }),
          ],
        ),
      );
    }

    Widget justPosted() {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 16,
            ),
            Text(
              'Just Posted',
              style: blackTextStyle.copyWith(fontSize: 16),
            ),
            SizedBox(
              height: 16,
            ),
            FutureBuilder<List<JobModel>>(
              future: jobProvider.getJobs(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Column(
                    children: snapshot.data
                        .map<Widget>((job) => CustomList(job))
                        .toList(),
                  );
                }
                return Center(child: CircularProgressIndicator());
              },
            )
          ],
        ),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [header(), body(), justPosted()],
          ),
        ),
      ),
      //NOTE: NAVBAR
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(top: 30),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          unselectedItemColor: greyColor,
          selectedItemColor: blackColor,
          currentIndex: 0,
          elevation: 0,
          iconSize: 24,
          items: [
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/navbar1.png'),
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/navbar2.png'),
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/navbar3.png'),
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/navbar4.png'),
                ),
                label: ''),
          ],
        ),
      ),
    );
  }
}
