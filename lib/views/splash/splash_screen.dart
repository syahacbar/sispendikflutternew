import 'dart:async';
import 'package:flutter/material.dart';
import '../home/home_page.dart';
import '../pages/main_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Navigasi otomatis ke HomePage setelah delay
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const MainPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF002F6C), // Warna biru SatuDikti
      body: Center(
        child: Image.asset(
          'assets/images/logosispendikbintuni3.png',
          width: 250,
          height: 250,
        ),
      ),
    );
  }
}
