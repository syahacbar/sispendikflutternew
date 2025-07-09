// lib/views/home/widgets/statistik_section.dart
import 'package:flutter/material.dart';

class StatistikSection extends StatelessWidget {
  const StatistikSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Statistik Pendidikan',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          height: 160,
          decoration: BoxDecoration(
            color: Colors.blue[50],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.blueAccent),
          ),
          child: const Center(
            child: Text(
              '📊 Grafik/Tabel Statistik akan tampil di sini',
              style: TextStyle(color: Colors.blueGrey),
            ),
          ),
        ),
      ],
    );
  }
}
