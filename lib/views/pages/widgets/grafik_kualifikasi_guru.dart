import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class GrafikKualifikasiGuru extends StatelessWidget {
  const GrafikKualifikasiGuru({super.key}); // Tetap const

  @override
  Widget build(BuildContext context) {
    final List<String> kualifikasi = ['D3', 'S1', 'S2', 'S3'];
    final List<int> jumlah = [35, 210, 28, 2];
    final List<Color> colors = [
      Colors.orange,
      Colors.blue,
      Colors.green,
      Colors.purple,
    ];

    final int total = jumlah.reduce((a, b) => a + b);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Kualifikasi Pendidikan Guru',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 250,
          child: PieChart(
            PieChartData(
              sections: List.generate(kualifikasi.length, (index) {
                final double percent = jumlah[index] / total * 100;
                return PieChartSectionData(
                  color: colors[index],
                  value: jumlah[index].toDouble(),
                  title: '${percent.toStringAsFixed(1)}%',
                  radius: 70,
                  titleStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                );
              }),
              sectionsSpace: 4,
              centerSpaceRadius: 40,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 12,
          runSpacing: 8,
          children: List.generate(kualifikasi.length, (index) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(width: 14, height: 14, color: colors[index]),
                const SizedBox(width: 6),
                Text('${kualifikasi[index]} (${jumlah[index]})'),
              ],
            );
          }),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
