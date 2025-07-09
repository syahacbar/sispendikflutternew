import 'package:flutter/material.dart';
import 'core/theme.dart';
import 'views/splash/splash_screen.dart';

void main() {
  runApp(const SispendikApp());
}

class SispendikApp extends StatelessWidget {
  const SispendikApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sispendik Bintuni',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const SplashScreen(), // ← default ke splash
    );
  }
}
