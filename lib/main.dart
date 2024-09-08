import 'package:flutter/material.dart';
import 'package:student_tawsel/homepage/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Student Tawsel App',
        theme: ThemeData(),
        home: const HomePage());
  }
}
