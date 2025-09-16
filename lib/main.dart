import 'package:flutter/material.dart';
import 'package:hellohand_mobile/core/theme/app_theme.dart';
import 'package:hellohand_mobile/presentation/screens/home/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const HelloHandApp());
}

class HelloHandApp extends StatelessWidget {
  const HelloHandApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HelloHand',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const HomeScreen(),
    );
  }
}