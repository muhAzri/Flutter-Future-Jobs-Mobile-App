import 'package:flutter/material.dart';
import 'package:flutter_future_jobs/models/category_model.dart';
import 'package:flutter_future_jobs/pages/category_page.dart';
import 'package:flutter_future_jobs/theme.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel category;

  CategoryCard(this.category);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CategoryPage(category)));
      },
      child: Container(
        width: 150,
        height: 200,
        margin: EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage(category.imageUrl))),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              category.name,
              style: whiteTextStyle.copyWith(fontWeight: medium, fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
