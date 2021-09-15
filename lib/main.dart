import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_future_jobs/widgets/category_card.dart';
import 'package:flutter_future_jobs/pages/detail_page.dart';
import 'package:flutter_future_jobs/pages/home_page.dart';
import 'package:flutter_future_jobs/pages/category_page.dart';
import 'package:flutter_future_jobs/pages/signin_page.dart';
import 'package:flutter_future_jobs/pages/signup_page.dart';
import 'package:flutter_future_jobs/pages/splash_screen.dart';
import 'package:flutter_future_jobs/pages/started_page.dart';
import 'package:flutter_future_jobs/provider/auth_provider.dart';
import 'package:flutter_future_jobs/provider/category_provider.dart';
import 'package:flutter_future_jobs/provider/job_provider.dart';
import 'package:flutter_future_jobs/provider/user_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
            create: (context) => AuthProvider()),
        ChangeNotifierProvider<UserProvider>(
            create: (context) => UserProvider()),
        ChangeNotifierProvider<CategoryProvider>(
            create: (context) => CategoryProvider()),
        ChangeNotifierProvider<JobProvider>(create: (context) => JobProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashScreen(),
          '/started': (context) => GetStartedPage(),
          '/sign-in': (context) => SignInPage(),
          '/sign-up': (context) => SignUpPage(),
          '/home': (context) => HomePage(),
        },
      ),
    );
  }
}
