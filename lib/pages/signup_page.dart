import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_future_jobs/models/user_model.dart';
import 'package:flutter_future_jobs/pages/signin_page.dart';
import 'package:flutter_future_jobs/provider/auth_provider.dart';
import 'package:flutter_future_jobs/provider/user_provider.dart';
import 'package:flutter_future_jobs/theme.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isUploaded = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');
  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController goalController = TextEditingController(text: '');

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProvider>(context);
    var userProvider = Provider.of<UserProvider>(context);

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

    Widget inputName() {
      return Column(
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
            controller: nameController,
            cursorColor: blueColor,
            onChanged: (value) {},
            decoration: InputDecoration(
                fillColor: lightGrey,
                filled: true,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                    borderSide: BorderSide.none),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                    borderSide: BorderSide(color: blueColor))),
            style: blueTextStyle,
          ),
        ],
      );
    }

    Widget inputEmail() {
      return Column(
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
            cursorColor: blueColor,
            onChanged: (value) {
              setState(() {});
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
                        color: EmailValidator.validate(emailController.text)
                            ? blueColor
                            : redColor)),
                hintText: ''),
            style: TextStyle(
                color: EmailValidator.validate(emailController.text)
                    ? blueColor
                    : redColor),
          ),
        ],
      );
    }

    Widget inputPassword() {
      return Column(
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
              controller: passwordController,
              cursorColor: blueColor,
              obscureText: true,
              onChanged: (value) {
                setState(() {});
              },
              decoration: InputDecoration(
                  fillColor: lightGrey,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: BorderSide.none),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: BorderSide(color: blueColor))),
              style: blueTextStyle),
        ],
      );
    }

    Widget inputGoal() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your Goal',
            style: greyTextStyle.copyWith(fontSize: 16),
          ),
          SizedBox(
            height: 8,
          ),
          TextFormField(
              controller: goalController,
              cursorColor: blueColor,
              onChanged: (value) {
                setState(() {});
              },
              decoration: InputDecoration(
                  fillColor: lightGrey,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: BorderSide.none),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: BorderSide(color: blueColor))),
              style: blueTextStyle),
        ],
      );
    }

    Widget signUpButton() {
      return Column(children: [
        Center(
          child: Container(
            width: 400,
            height: 45,
            child: isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : TextButton(
                    onPressed: () async {
                      if (nameController.text.isEmpty ||
                          emailController.text.isEmpty ||
                          passwordController.text.isEmpty ||
                          goalController.text.isEmpty) {
                        print('Snackbar muncul kaga');
                        // ignore: deprecated_member_use
                        _scaffoldKey.currentState!.showSnackBar(SnackBar(
                          content: Text('Semua Field Harus Diisi'),
                          backgroundColor: redColor,
                          duration: Duration(seconds: 3),
                        ));
                      } else {
                        setState(() {
                          isLoading = true;
                        });

                        UserModel? user = await authProvider.register(
                            emailController.text,
                            passwordController.text,
                            nameController.text,
                            goalController.text);

                        setState(() {
                          isLoading = false;
                        });

                        if (user == null) {
                          _scaffoldKey.currentState!.showSnackBar(SnackBar(
                          content: Text('Email Sudah Terdaftar'),
                          backgroundColor: redColor,
                          duration: Duration(seconds: 3),
                        ));
                        } else {
                          userProvider.user = user;
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/home', (route) => false);
                        }
                      }
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
      ]);
    }

    Widget signInButton() {
      return Column(
        children: [
          Center(
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignInPage()));
              },
              child: Text(
                'Back to Sign In',
                style: greyTextStyle.copyWith(fontWeight: light),
              ),
            ),
          )
        ],
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: _scaffoldKey,
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
                      inputName(),
                      SizedBox(
                        height: 20,
                      ),
                      //INPUT
                      inputEmail(),
                      SizedBox(
                        height: 20,
                      ),
                      inputPassword(),
                      SizedBox(
                        height: 20,
                      ),
                      inputGoal(),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  signUpButton(),
                  SizedBox(
                    height: 20,
                  ),
                  signInButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
