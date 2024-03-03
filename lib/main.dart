import 'package:flutter/material.dart';
import 'package:project/screens/HomePage.dart';
import 'package:project/screens/loginScreen.dart';
import 'package:project/screens/registerScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
       body: Login(),
      ),
    );
  }
}

