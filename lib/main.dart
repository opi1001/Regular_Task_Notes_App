import 'package:flutter/material.dart';
import 'package:simple_notes_app/screens/home_screen.dart';

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
      title: 'Simple Notes app',
      theme: ThemeData(
        // primaryColorLight: Colors.black,
        primarySwatch: Colors.blue,
        //scaffoldBackgroundColor: Colors.black,
        brightness: Brightness.dark,
      ),
      home: const HomeScreen(),
    );
  }
}
