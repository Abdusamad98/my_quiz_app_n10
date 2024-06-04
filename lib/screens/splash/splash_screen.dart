import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_quiz_app/data/data_repository.dart';
import 'package:my_quiz_app/screens/subjects/subjects_screen.dart';
import 'package:my_quiz_app/utils/icons.dart';
import 'package:my_quiz_app/utils/size/size_utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _init();
    super.initState();
  }

  _init() async {
    DataRepository.instance.loadSubjects();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return SubjectsScreen();
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: Lottie.asset(AppImages.testAnimation),
      ),
    );
  }
}
