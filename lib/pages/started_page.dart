import 'package:flutter/material.dart';
import 'package:flutter_future_jobs/pages/signin_page.dart';
import 'package:flutter_future_jobs/theme.dart';

class GetStartedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/bg_getstarted.png'),
                    fit: BoxFit.cover)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                ),
                Text(
                  'Build Your Next\nFuture Career Like\na Master',
                  style: whiteTextStyle.copyWith(
                    fontSize: 32,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  '18,000 jobs available',
                  style: whiteTextStyle.copyWith(fontWeight: light),
                ),
                SizedBox(
                  height: 400,
                ),
                Center(
                  child: Column(
                    children: [
                      Container(
                        width: 200,
                        height: 45,
                        child: TextButton(
                            style: TextButton.styleFrom(
                                backgroundColor: whiteColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(66))),
                            onPressed: () {},
                            child: Text(
                              'Get Started',
                              style: blueTextStyle.copyWith(fontWeight: medium),
                            )),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        width: 200,
                        height: 45,
                        child: OutlineButton(
                            borderSide: BorderSide(
                              color: whiteColor,
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(66)),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignInPage()
                                )
                              );
                            },
                            child: Text(
                              'Sign In',
                              style:
                                  whiteTextStyle.copyWith(fontWeight: medium),
                            )),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
