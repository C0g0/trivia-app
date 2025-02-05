import 'package:flutter/material.dart';

class LoadingAlert extends StatelessWidget {
  const LoadingAlert({
    super.key,
    required this.child,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        height: height * size.height,
        width: width * size.width,
        margin: EdgeInsets.all(height * 0.05),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 253, 231),
            borderRadius: BorderRadius.circular(20)),
        child: child,
      ),
    );
  }
}
