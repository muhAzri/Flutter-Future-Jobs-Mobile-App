import 'package:flutter/material.dart';
import 'package:flutter_future_jobs/models/category_model.dart';
import 'package:flutter_future_jobs/models/job_model.dart';
import 'package:flutter_future_jobs/provider/job_provider.dart';
import 'package:flutter_future_jobs/theme.dart';
import 'package:flutter_future_jobs/widgets/custom_list.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatelessWidget {
  final CategoryModel category;

  CategoryPage(this.category);

  @override
  Widget build(BuildContext context) {
    var jobProvider = Provider.of<JobProvider>(context);

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
                      child: Image.network(
                        category.imageUrl,
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
                          category.name,
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
                      FutureBuilder<List<JobModel>>(
                        future: jobProvider.getJobsByCategory(category.name),
                        builder: (context, AsyncSnapshot snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
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
                      FutureBuilder<List<JobModel>>(
                        future: jobProvider.getJobsByCategory(category.name),
                        builder: (context, AsyncSnapshot snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
