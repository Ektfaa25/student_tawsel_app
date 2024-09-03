import 'package:flutter/material.dart';
import 'package:student_tawsel/home_page.dart';

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
      title: 'Student Tawsel App',
      theme: ThemeData(),
      home: HomePage(),
    );
  }
}
