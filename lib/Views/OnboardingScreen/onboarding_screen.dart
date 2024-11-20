import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});
  @override
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  Future writeData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('is_first_time', true);
    print('Data store Success');
  }

  @override
  void initState() {
    super.initState();
    writeData();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("This is onboarding Screen"),
      ),
    );
  }
}
