import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_future_jobs/pages/started_page.dart';
import 'package:flutter_future_jobs/theme.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          // ignore: non_constant_identifier_names
          context, MaterialPageRoute(builder: (Context) => GetStartedPage()
          )
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff4141A4),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Image.asset(
                'assets/logo.png',
                width: 59,
                height: 76,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              'FUTUREJOB',
              style: whiteTextStyle.copyWith(
                  fontSize: 32, fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}
