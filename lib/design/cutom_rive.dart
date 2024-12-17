import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

final class RiveWidget extends StatelessWidget {
  final String riveFilePath;
  final double width;
  final double height;

  const RiveWidget({
    Key? key,
    required this.riveFilePath,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: RiveAnimation.asset(
        riveFilePath,
        fit: BoxFit.cover,
      ),
    );
  }

  static RiveWidget firefly(double width, double height) {
    return RiveWidget(
      riveFilePath: 'images/firefly.riv',
      width: width,
      height: height,
    );
  }

  static RiveWidget fireRunner(double width, double height) {
    return RiveWidget(
      riveFilePath: 'images/firerunner.riv',
      width: width,
      height: height,
    );
  }

  static RiveWidget fireWalker(double width, double height) {
    return RiveWidget(
      riveFilePath: 'images/main2.riv',
      width: width,
      height: height,
    );
  }
}
