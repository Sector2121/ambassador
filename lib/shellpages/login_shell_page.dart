import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:ambassador/index.dart';

class LoginShellPage extends StatelessWidget {
  final Widget child;

  LoginShellPage({super.key, required this.child});

  final ApplicationConfig _applicationConfig = GetIt.instance.get<ApplicationConfig>();

  @override
  Widget build(BuildContext context) {
    final asd = MediaQuery.of(context);

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    final String assetName = 'assets/screen.png';

    print('hello');

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
            child: SizedBox(
              height: height * 0.65,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: child,
              ),
            ),
          ),
        )
      ],
    );
  }
}
