import 'package:flutter/material.dart';

class BackgroundApp extends StatelessWidget {
  final Widget child;
  const BackgroundApp({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/background_shapes.png'),
              fit: BoxFit.cover)),
      child: child,
    );
  }
}
