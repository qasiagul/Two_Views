import 'package:flutter/material.dart';
import 'package:twoviews/view_1.dart';
import 'package:twoviews/view_2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TaskViewRealtime(),
    );
  }
}