// lib/core/dummy_data.dart
import 'package:flutter/material.dart';

class DummyData {
  static List<String> banners = [
    'https://picsum.photos/id/1011/800/300',
    'https://picsum.photos/id/1012/800/300',
    'https://picsum.photos/id/1015/800/300',
  ];

  static List<Map<String, dynamic>> menuItems = [
    {'icon': Icons.school, 'label': 'Data Sekolah', 'color': Colors.blue},
    {'icon': Icons.person, 'label': 'Data PTK', 'color': Colors.orange},
    {'icon': Icons.group, 'label': 'Data Siswa', 'color': Colors.purple},
    {
      'icon': Icons.inventory,
      'label': 'Data Sarana dan Prasarana',
      'color': Colors.green,
    },
  ];

  static List<Map<String, dynamic>> programs = [
    {
      'icon': Icons.lightbulb,
      'title': 'Kampus Merdeka',
      'desc': 'Program belajar di luar kampus',
    },
    {
      'icon': Icons.monetization_on,
      'title': 'Beasiswa',
      'desc': 'Dapatkan beasiswa unggulan',
    },
  ];

  static List<Map<String, String>> news = [
    {
      'title': 'Pengumuman Beasiswa Nasional 2025',
      'date': '01 Juli 2025',
      'image': 'https://picsum.photos/100/80?random=1',
    },
    {
      'title': 'Peluncuran Kurikulum Baru Pendidikan',
      'date': '28 Juni 2025',
      'image': 'https://picsum.photos/100/80?random=2',
    },
  ];
}
