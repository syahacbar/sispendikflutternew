import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class GrafikSaranaPrasarana extends StatelessWidget {
  const GrafikSaranaPrasarana({super.key});

  @override
  Widget build(BuildContext context) {
    final jenjang = ['PAUD', 'SD', 'SMP', 'SMA', 'SMK', 'SLB', 'PKBM'];

    final data = [
      [2, 3, 5, 10], // PAUD
      [4, 6, 10, 20], // SD
      [1, 3, 4, 15], // SMP
      [0, 2, 3, 10], // SMA
      [1, 1, 2, 8], // SMK
      [0, 1, 0, 2], // SLB
      [0, 0, 1, 5], // PKBM
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Kondisi Sarana Prasarana per Jenjang',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 300,
          child: BarChart(
            BarChartData(
              titlesData: FlTitlesData(
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: true),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, _) {
                      return Text(
                        jenjang[value.toInt()],
                        style: const TextStyle(fontSize: 10),
                      );
                    },
                    interval: 1,
                  ),
                ),
              ),
              barGroups: List.generate(jenjang.length, (i) {
                final d = data[i];
                return BarChartGroupData(
                  x: i,
                  barRods: [
                    BarChartRodData(
                      toY: d[0] + d[1] + d[2] + d[3].toDouble(),
                      rodStackItems: [
                        BarChartRodStackItem(0, d[0].toDouble(), Colors.red),
                        BarChartRodStackItem(
                          d[0].toDouble(),
                          d[0] + d[1].toDouble(),
                          Colors.orange,
                        ),
                        BarChartRodStackItem(
                          d[0] + d[1].toDouble(),
                          d[0] + d[1] + d[2].toDouble(),
                          Colors.yellow,
                        ),
                        BarChartRodStackItem(
                          d[0] + d[1] + d[2].toDouble(),
                          d[0] + d[1] + d[2] + d[3].toDouble(),
                          Colors.green,
                        ),
                      ],
                      width: 20,
                      borderRadius: BorderRadius.zero,
                    ),
                  ],
                );
              }),
              gridData: FlGridData(show: true),
              borderData: FlBorderData(show: false),
              barTouchData: BarTouchData(enabled: true),
              alignment: BarChartAlignment.spaceAround,
              maxY: 40,
            ),
          ),
        ),
      ],
    );
  }
}
