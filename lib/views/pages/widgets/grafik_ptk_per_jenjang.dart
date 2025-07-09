import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class GrafikPTKPerJenjang extends StatelessWidget {
  const GrafikPTKPerJenjang({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Jumlah PTK per Jenjang (berdasarkan Status Kepegawaian)',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 300,
          child: BarChart(
            BarChartData(
              barGroups: _generateBarGroups(),
              titlesData: FlTitlesData(
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: _bottomTitles,
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: true),
                ),
                topTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
              ),
              barTouchData: BarTouchData(enabled: true),
              gridData: FlGridData(show: true),
              borderData: FlBorderData(show: false),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 16,
          children: const [
            _Legend(color: Colors.blue, label: 'PNS'),
            _Legend(color: Colors.green, label: 'PPPK'),
            _Legend(color: Colors.orange, label: 'Honorer'),
            _Legend(color: Colors.purple, label: 'GTY'),
          ],
        ),
      ],
    );
  }

  List<BarChartGroupData> _generateBarGroups() {
    final data = [
      // Format: [PNS, PPPK, Honorer, GTY]
      [5, 2, 3, 1], // PAUD
      [15, 3, 5, 2], // SD
      [12, 5, 7, 3], // SMP
      [8, 4, 6, 2], // SMA
      [7, 3, 4, 2], // SMK
      [2, 1, 1, 0], // SLB
      [3, 2, 2, 1], // PKBM
    ];

    return List.generate(data.length, (index) {
      final d = data[index];
      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: (d[0] + d[1] + d[2] + d[3]).toDouble(),
            rodStackItems: [
              BarChartRodStackItem(0, d[0].toDouble(), Colors.blue),
              BarChartRodStackItem(
                d[0].toDouble(),
                d[0] + d[1].toDouble(),
                Colors.green,
              ),
              BarChartRodStackItem(
                d[0] + d[1].toDouble(),
                d[0] + d[1] + d[2].toDouble(),
                Colors.orange,
              ),
              BarChartRodStackItem(
                d[0] + d[1] + d[2].toDouble(),
                d[0] + d[1] + d[2] + d[3].toDouble(),
                Colors.purple,
              ),
            ],
            width: 20,
            borderRadius: BorderRadius.circular(4),
          ),
        ],
      );
    });
  }

  Widget _bottomTitles(double value, TitleMeta meta) {
    final jenjang = ['PAUD', 'SD', 'SMP', 'SMA', 'SMK', 'SLB', 'PKBM'];
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(jenjang[value.toInt()], style: const TextStyle(fontSize: 10)),
    );
  }
}

class _Legend extends StatelessWidget {
  final Color color;
  final String label;

  const _Legend({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(width: 14, height: 14, color: color),
        const SizedBox(width: 4),
        Text(label),
      ],
    );
  }
}
