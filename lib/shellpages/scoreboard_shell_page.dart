import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ScoreBoardShellPage extends StatelessWidget {
  final Widget body;

  const ScoreBoardShellPage({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: width * 0.4,
              child: Expanded(
                child: Image.asset('assets/diverzumpng.png'),
              ),
            ),
          ],
        ),
      ),
      body: body,
    );
  }
}
