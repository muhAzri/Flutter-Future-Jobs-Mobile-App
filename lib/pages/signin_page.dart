import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_future_jobs/pages/home_page.dart';
import 'package:flutter_future_jobs/pages/signup_page.dart';
import 'package:flutter_future_jobs/theme.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool isEmailValid = true;

  TextEditingController emailController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sign In',
                      style: greyTextStyle.copyWith(fontSize: 16),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      'Build Your Career',
                      style: blackTextStyle.copyWith(
                          fontSize: 24, fontWeight: semibold),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Center(
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/illustration.png',
                            width: 261.49,
                            height: 240,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Email Address',
                          style: greyTextStyle.copyWith(fontSize: 16),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                          controller: emailController,
                          onChanged: (value) {
                            print(value);
                            bool isValid = EmailValidator.validate(value);
                            print(isValid);
                            if (isValid) {
                              setState(() {
                                isEmailValid = true;
                              });
                            } else {
                              setState(() {
                                isEmailValid = false;
                              });
                            }
                          },
                          decoration: InputDecoration(
                              fillColor: lightGrey,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100),
                                  borderSide: BorderSide.none),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100),
                                  borderSide: BorderSide(
                                      color:
                                          isEmailValid ? blueColor : redColor)),
                              hintText: ''),
                          style: TextStyle(
                              color: isEmailValid ? blueColor : redColor),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Password',
                          style: greyTextStyle.copyWith(fontSize: 16),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                              fillColor: lightGrey,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100),
                                  borderSide: BorderSide.none),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100),
                                  borderSide: BorderSide(color: blueColor))),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Center(
                      child: Container(
                        width: 400,
                        height: 45,
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()
                                  )
                              );
                            },
                            style: TextButton.styleFrom(
                                backgroundColor: blueColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(66))),
                            child: Text(
                              'Sign In',
                              style:
                                  whiteTextStyle.copyWith(fontWeight: medium),
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpPage()));
                        },
                        child: Text(
                          'Create New Account',
                          style: greyTextStyle.copyWith(fontWeight: light),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
