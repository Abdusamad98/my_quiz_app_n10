import 'package:flutter/material.dart';
import 'package:my_quiz_app/screens/splash/splash_screen.dart';
import 'package:my_quiz_app/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.C_273032,
          elevation: 0,
        ),
        scaffoldBackgroundColor: AppColors.C_273032,
        useMaterial3: false,
      ),
      home: const SplashScreen(),
    );
  }
}

Null n = null;
