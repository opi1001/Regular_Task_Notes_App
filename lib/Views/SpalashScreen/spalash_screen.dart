import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_notes_app/Views/OnboardingScreen/onboarding_screen.dart';
import 'package:simple_notes_app/screens/home_screen.dart';

class SpalashScreen extends StatefulWidget {
  const SpalashScreen({super.key});
  @override
  State<SpalashScreen> createState() => _SpalashScreenState();
}

class _SpalashScreenState extends State<SpalashScreen> {
  Future checkRoute() async {
    final prefs = await SharedPreferences.getInstance();
    bool IsFirstTimes = prefs.getBool('is_first_time') ?? true;
    if (IsFirstTimes == true) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => OnboardingScreen()));
    } else {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const HomeScreen()));
    }
  }

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      checkRoute();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("SplashScreen"),
      ),
    );
  }
}
