import 'dart:math';

import 'package:flutter/material.dart';

class LoginShellPage extends StatelessWidget {
  final Widget child;

  LoginShellPage({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    const String assetName = 'assets/screen.png';

    final loginPageHeight = MediaQuery.of(context).viewInsets.bottom == 0 ? height * 0.6 : height * 0.4;

    return Stack(
      children: [
        SizedBox.expand(
          child: FittedBox(fit: BoxFit.fill, child: Image.asset(assetName)),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: loginPageHeight,
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: child,
                  ),
                ),
                SizedBox(
                  height: max(MediaQuery.of(context).viewInsets.bottom, 0),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
