import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ApplicationConfig {
  final Color mainColor = const Color.fromARGB(255, 166, 89, 199);

  final Map<AppImages, AppImage> appImages = {};
}

enum AppImages {
 splash,
}

class AppImage {
  final String iconPath;

  AppImage({
    required this.iconPath,
  });
}

class AppIcon extends StatelessWidget {
  final Color? iconColor;
  final double? iconSize;
  final double? height;
  final double? width;
  final AppImage? appImage;

  AppIcon({
    Key? key,
    this.appImage,
    this.iconColor,
    this.iconSize,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (appImage == null) {
      return Container();
    }

    final String assetName = 'assets/asd.svg';

    return SvgPicture.asset(assetName);
  }
}