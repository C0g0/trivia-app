import 'package:flutter/material.dart';
import 'package:quiz_app/presentation/screens/home_screen.dart';
import 'package:quiz_app/config/router/app_router.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      routes: appRouter,
    );
  }
}
