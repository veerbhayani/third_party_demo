import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FlutterSvgDemo extends StatefulWidget {
  const FlutterSvgDemo({super.key});

  @override
  State<FlutterSvgDemo> createState() => _FlutterSvgDemoState();
}

class _FlutterSvgDemoState extends State<FlutterSvgDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(
          'assets/images/file006946.svg',
        ),
      ),
    );
  }
}
