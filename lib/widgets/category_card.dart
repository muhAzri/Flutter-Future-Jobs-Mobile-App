import 'package:flutter/material.dart';
import 'package:flutter_future_jobs/pages/second_home_page.dart';
import 'package:flutter_future_jobs/theme.dart';

class CategoryCard extends StatelessWidget {
  final String text;
  final String imageurl;

  CategoryCard({required this.text, required this.imageurl});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (context) => SecondHomePage(
                jobTitleHome: text,
                imageurl: imageurl,
              )));
      },
      child: Container(
        width: 150,
        height: 200,
        decoration:
            BoxDecoration(image: DecorationImage(image: AssetImage(imageurl))),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              text,
              style: whiteTextStyle.copyWith(fontWeight: medium, fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
