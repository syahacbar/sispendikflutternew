import 'package:flutter/material.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int _selectedIndex = 0;

  final List<BottomNavigationBarItem> _items = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined),
      activeIcon: Icon(Icons.home),
      label: 'Beranda',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.school_outlined),
      activeIcon: Icon(Icons.school),
      label: 'Sekolah',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.bar_chart_outlined),
      activeIcon: Icon(Icons.bar_chart),
      label: 'Statistik',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.account_circle_outlined),
      activeIcon: Icon(Icons.account_circle),
      label: 'Profil',
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // Arahkan ke halaman sesuai indeks di sini jika sudah ada routing
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      type: BottomNavigationBarType.fixed,
      items: _items,
    );
  }
}
