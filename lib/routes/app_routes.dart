import 'package:flutter/material.dart';
import '../views/home/home_page.dart';
import '../views/splash/splash_screen.dart';
import '../views/pages/list_sekolah_page.dart';

class AppRoutes {
  static final routes = <String, WidgetBuilder>{
    '/': (context) => const SplashScreen(),
    '/home': (context) => const HomePage(),
    // tambahkan rute lain di sini jika ada
  };

  final Map<String, WidgetBuilder> appRoutes = {
    '/sekolah': (context) => const ListSekolahPage(),
    // halaman lain
  };
}
