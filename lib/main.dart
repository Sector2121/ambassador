import 'package:flutter/material.dart';
import 'package:ambassador/index.dart';
import 'package:go_router/go_router.dart';

void main() {
  registerServices();
  registerBlocs();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GoRouter _router = createRouterConfig();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
