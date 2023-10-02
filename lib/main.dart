import 'package:flutter/material.dart';
import 'package:ambassador/index.dart';

void main() {
  registerServices();
  registerBlocs();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cost Accountant',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: EmailPage(),
    );
  }
}
