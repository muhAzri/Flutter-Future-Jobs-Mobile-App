import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_future_jobs/models/user_model.dart';
import 'package:flutter_future_jobs/pages/home_page.dart';
import 'package:flutter_future_jobs/provider/auth_provider.dart';
import 'package:flutter_future_jobs/provider/user_provider.dart';
import 'package:flutter_future_jobs/theme.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool isEmailValid = true;

  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProvider>(context);
    var userProvider = Provider.of<UserProvider>(context);

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
                    borderSide:
                        BorderSide(color: isEmailValid ? blueColor : redColor)),
                hintText: ''),
            style: TextStyle(color: isEmailValid ? blueColor : redColor),
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
      );
    }

    Widget loginButton() {
      return Center(
        child: Container(
          width: 400,
          height: 45,
          child: isLoading
              ? Center(child: CircularProgressIndicator())
              : TextButton(
                  onPressed: () async {
                    if (emailController.text.isEmpty ||
                        passwordController.text.isEmpty) {
                      _scaffoldKey.currentState!.showSnackBar(SnackBar(
                        content: Text('Semua Field Harus Diisi'),
                        backgroundColor: redColor,
                        duration: Duration(seconds: 3),
                      ));
                    } else {
                      setState(() {
                        isLoading = true;
                      });

                      UserModel? user = await authProvider.login(
                          emailController.text, passwordController.text);

                      setState(() {
                        isLoading = false;
                      });

                      if (user == null) {
                        _scaffoldKey.currentState!.showSnackBar(SnackBar(
                          content: Text('Email atau password salah'),
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
                    'Sign In',
                    style: whiteTextStyle.copyWith(fontWeight: medium),
                  )),
        ),
      );
    }

    Widget registerButton() {
      return Center(
        child: InkWell(
          onTap: () {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => SignUpPage()));
            Navigator.pushNamedAndRemoveUntil(
                context, '/sign-up', (route) => false);
          },
          child: Text(
            'Create New Account',
            style: greyTextStyle.copyWith(fontWeight: light),
          ),
        ),
      );
    }

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          key: _scaffoldKey,
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
                    inputEmail(),
                    SizedBox(
                      height: 20,
                    ),
                    inputPassword(),
                    SizedBox(
                      height: 40,
                    ),
                    loginButton(),
                    SizedBox(
                      height: 20,
                    ),
                    registerButton(),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
