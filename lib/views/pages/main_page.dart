import 'package:flutter/material.dart';
import '../home/home_page.dart';
// import 'package:sispendikbintuni_flutter/views/pages/statistik_pendidikan_page.dart';
// import 'package:sispendikbintuni_flutter/views/pages/pencarian_data_page.dart';
import 'package:sispendikbintuni_flutter/views/pages/direktori_pendidikan_page.dart';
import 'package:sispendikbintuni_flutter/views/pages/peta_sebaran_page.dart';
import 'package:sispendikbintuni_flutter/views/pages/form_pengaduan_page.dart';
import 'package:sispendikbintuni_flutter/views/pages/tentang_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    DirektoriPendidikanPage(),
    PetaSebaranPage(),
    FormPengaduanPage(),
    TentangPage(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _pages),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onTabTapped,
        selectedItemColor: Colors.blue[800],
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Direktori Pendidikan',
          ),

          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Peta Sebaran'),
          BottomNavigationBarItem(
            icon: Icon(Icons.feedback),
            label: 'Pengaduan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            label: 'Tentang',
          ),
        ],
      ),
    );
  }
}
