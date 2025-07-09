import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class GrafikSekolahPerJenjang extends StatefulWidget {
  const GrafikSekolahPerJenjang({super.key});

  @override
  State<GrafikSekolahPerJenjang> createState() =>
      _GrafikSekolahPerJenjangState();
}

class _GrafikSekolahPerJenjangState extends State<GrafikSekolahPerJenjang> {
  String selectedStatus = 'Semua';

  final List<String> jenjang = [
    'PAUD',
    'SD',
    'SMP',
    'SMA',
    'SMK',
    'SLB',
    'PKBM',
  ];

  final Map<String, List<int>> data = {
    'Semua': [12, 30, 18, 6, 5, 2, 4],
    'Negeri': [10, 25, 14, 3, 2, 1, 1],
    'Swasta': [2, 5, 4, 3, 3, 1, 3],
  };

  @override
  Widget build(BuildContext context) {
    final chartData = data[selectedStatus]!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Jumlah Sekolah per Jenjang',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),

        // Tab status
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: ['Semua', 'Negeri', 'Swasta'].map((status) {
            final isSelected = selectedStatus == status;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: ChoiceChip(
                label: Text(status),
                selected: isSelected,
                onSelected: (_) => setState(() => selectedStatus = status),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 16),

        // Grafik Bar
        SizedBox(
          height: 220,
          child: BarChart(
            BarChartData(
              borderData: FlBorderData(show: false),
              gridData: FlGridData(show: false),
              titlesData: FlTitlesData(
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: true),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, _) {
                      int index = value.toInt();
                      if (index < jenjang.length) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            jenjang[index],
                            style: const TextStyle(fontSize: 10),
                          ),
                        );
                      }
                      return const SizedBox.shrink();
                    },
                    reservedSize: 36,
                  ),
                ),
                topTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
              ),
              barGroups: List.generate(jenjang.length, (index) {
                return BarChartGroupData(
                  x: index,
                  barRods: [
                    BarChartRodData(
                      toY: chartData[index].toDouble(),
                      color: Colors.blue,
                      width: 18,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ],
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}
