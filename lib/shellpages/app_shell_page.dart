import 'package:flutter/material.dart';

class AppShellPage extends StatelessWidget {
  final Widget child;

  const AppShellPage({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: child,
      ),
    );
  }
}
