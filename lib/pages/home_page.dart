import 'package:flutter/material.dart';
import 'package:flutter_future_jobs/theme.dart';
import 'package:flutter_future_jobs/widgets/category_card.dart';
import 'package:flutter_future_jobs/widgets/custom_list.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                    'Muhammad Azri',
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hot Categories',
                style: blackTextStyle.copyWith(fontSize: 16),
              ),
              SizedBox(
                height: 16,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CategoryCard(
                        text: 'Website\nDeveloper',
                        imageurl: 'assets/card_category1.png'),
                    SizedBox(width: 16),
                    CategoryCard(
                        text: 'Mobile\nDeveloper',
                        imageurl: 'assets/card_category2.png'),
                    SizedBox(width: 16),
                    CategoryCard(
                        text: 'App\nDesigner',
                        imageurl: 'assets/card_category3.png'),
                    SizedBox(width: 16),
                    CategoryCard(
                        text: 'Content\nWriter',
                        imageurl: 'assets/card_category4.png'),
                    SizedBox(width: 16),
                    CategoryCard(
                        text: 'Video\nGrapher',
                        imageurl: 'assets/card_category5.png'),
                    SizedBox(width: 16),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                'Just Posted',
                style: blackTextStyle.copyWith(fontSize: 16),
              ),
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
          ),
        ),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(),
              SizedBox(
                height: 30,
              ),
              body()
            ],
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
