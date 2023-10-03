import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ambassador/index.dart';

class LoginShellPage extends StatelessWidget {
  final ApplicationConfig _applicationConfig = GetIt.instance.get<ApplicationConfig>();

  final Widget child;

  LoginShellPage({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Container(
          color: _applicationConfig.mainColor,
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
            child: SizedBox(
              height: height * 0.6,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: child,
              ),
            ),
          ),
        )
      ],
    );
  }
}
