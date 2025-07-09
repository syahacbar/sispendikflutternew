import 'package:flutter/material.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int _selectedIndex = 0;

  final List<BottomNavigationBarItem> _items = const [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
    BottomNavigationBarItem(
      icon: Icon(Icons.bar_chart),
      label: 'Statistik Pendidikan',
    ),
    BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Pencarian Data'),
    BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Peta Sebaran'),
    BottomNavigationBarItem(icon: Icon(Icons.feedback), label: 'Pengaduan'),
    BottomNavigationBarItem(icon: Icon(Icons.info_outline), label: 'Tentang'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // TODO: Tambahkan navigasi ke halaman sesuai index
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: _items,
      currentIndex: _selectedIndex,
      selectedItemColor: const Color(0xFF002F6C),
      unselectedItemColor: Colors.grey,
      onTap: _onItemTapped,
      type: BottomNavigationBarType.fixed,
    );
  }
}
