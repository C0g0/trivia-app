import 'package:flutter/material.dart';
import 'package:quiz_app/presentation/screens/screens.dart';

final Map<String, Widget Function(BuildContext)> appRouter = {
  'home': (context) => const HomeScreen(),
  'categories': (context) => const CategoriesScreen(),
};
