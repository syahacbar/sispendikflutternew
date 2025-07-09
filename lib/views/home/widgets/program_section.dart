// lib/views/home/widgets/program_section.dart
import 'package:flutter/material.dart';
import '../../../core/dummy_data.dart';

class ProgramSection extends StatelessWidget {
  const ProgramSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            'Program Unggulan',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.only(left: 16, bottom: 12),
          child: Row(
            children: DummyData.programs.map((item) {
              return Card(
                margin: const EdgeInsets.only(right: 12),
                child: Container(
                  width: 160,
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(item['icon'], size: 28),
                      const SizedBox(height: 8),
                      Text(
                        item['title'],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(item['desc'], style: const TextStyle(fontSize: 12)),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
