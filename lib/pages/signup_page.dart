import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_future_jobs/pages/home_page.dart';
import 'package:flutter_future_jobs/pages/signin_page.dart';
import 'package:flutter_future_jobs/theme.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isEmailValid = true;
  bool isUploaded = false;

  TextEditingController emailController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    Widget uploadedImage() {
      return Center(
        child: InkWell(
          onTap: () {
            setState(() {
              isUploaded = !isUploaded;
            });
          },
          child: Column(
            children: [
              Image.asset(
                'assets/upload_pic.png',
                width: 120,
              )
            ],
          ),
        ),
      );
    }

    Widget showImages() {
      return Center(
        child: InkWell(
          onTap: () {
            setState(() {
              isUploaded = !isUploaded;
            });
          },
          child: Column(
            children: [
              Image.asset(
                'assets/uploaded_pic.png',
                width: 120,
              )
            ],
          ),
        ),
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sign Up',
                    style: greyTextStyle.copyWith(fontSize: 16),
                  ),
                  Text(
                    'Begin New Journey',
                    style: blackTextStyle.copyWith(
                        fontWeight: semibold, fontSize: 24),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  isUploaded ? showImages() : uploadedImage(),
                  SizedBox(
                    height: 50,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Full Name',
                        style: greyTextStyle.copyWith(fontSize: 16),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TextFormField(
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
                      SizedBox(
                        height: 20,
                      ),
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
                      SizedBox(
                        height: 20,
                      ),
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
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Your Goal',
                        style: greyTextStyle.copyWith(fontSize: 16),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TextFormField(
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
                      SizedBox(
                        height: 20,
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
                                    builder: (context) => HomePage()));
                          },
                          style: TextButton.styleFrom(
                              backgroundColor: blueColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(66))),
                          child: Text(
                            'Sign Up',
                            style: whiteTextStyle.copyWith(fontWeight: medium),
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
                                builder: (context) => SignInPage()));
                      },
                      child: Text(
                        'Back to Sign In',
                        style: greyTextStyle.copyWith(fontWeight: light),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
