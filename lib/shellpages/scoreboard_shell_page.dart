import 'package:flutter/material.dart';

class ScoreBoardShellPage extends StatelessWidget {
  final Widget body;

  const ScoreBoardShellPage({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.add),
      ),
      body: body,
    );
  }
}
