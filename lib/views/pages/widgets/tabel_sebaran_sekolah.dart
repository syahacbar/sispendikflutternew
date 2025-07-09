import 'package:flutter/material.dart';

class TabelSebaranSekolah extends StatelessWidget {
  TabelSebaranSekolah({super.key});

  final List<Map<String, dynamic>> data = const [
    {
      "distrik": "Babo",
      "paud": 2,
      "sd": 5,
      "smp": 2,
      "sma": 1,
      "smk": 0,
      "slb": 0,
      "pkbm": 1,
    },
    {
      "distrik": "Bintuni",
      "paud": 4,
      "sd": 6,
      "smp": 3,
      "sma": 2,
      "smk": 1,
      "slb": 1,
      "pkbm": 1,
    },
    {
      "distrik": "Manimeri",
      "paud": 3,
      "sd": 4,
      "smp": 2,
      "sma": 1,
      "smk": 0,
      "slb": 0,
      "pkbm": 0,
    },
    {
      "distrik": "Moskona Selatan",
      "paud": 1,
      "sd": 2,
      "smp": 1,
      "sma": 0,
      "smk": 0,
      "slb": 0,
      "pkbm": 0,
    },
    // Tambahkan distrik lainnya sesuai kebutuhan
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Sebaran Sekolah per Distrik',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 400,
          child: Row(
            children: [
              // Kolom tetap (No & Distrik)
              Container(
                width: 140,
                color: Colors.grey[200],
                child: ListView(
                  children: [
                    _buildHeaderCell('No', isHeader: true),
                    for (var i = 0; i < data.length; i++)
                      _buildHeaderCell('${i + 1}', isHeader: false),
                  ],
                ),
              ),
              Container(
                width: 160,
                color: Colors.grey[200],
                child: ListView(
                  children: [
                    _buildHeaderCell('Distrik', isHeader: true),
                    for (var row in data)
                      _buildHeaderCell(row['distrik'], isHeader: false),
                  ],
                ),
              ),
              // Scrollable kolom jenjang
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    children: [
                      Row(
                        children: _jenjangHeaders
                            .map(
                              (j) =>
                                  _buildCell(j.toUpperCase(), isHeader: true),
                            )
                            .toList(),
                      ),
                      ...data.map((row) {
                        final total = _jenjangKeys
                            .map((key) => row[key] as int)
                            .reduce((a, b) => a + b);
                        return Row(
                          children: [
                            ..._jenjangKeys.map(
                              (key) => _buildCell('${row[key]}'),
                            ),
                            _buildCell('$total', isBold: true),
                          ],
                        );
                      }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  static const List<String> _jenjangKeys = [
    'paud',
    'sd',
    'smp',
    'sma',
    'smk',
    'slb',
    'pkbm',
  ];
  static const List<String> _jenjangHeaders = [
    'PAUD',
    'SD',
    'SMP',
    'SMA',
    'SMK',
    'SLB',
    'PKBM',
    'Total',
  ];

  Widget _buildCell(String text, {bool isHeader = false, bool isBold = false}) {
    return Container(
      width: 80,
      height: 48,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        color: isHeader ? Colors.blue[100] : null,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: isHeader || isBold ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }

  Widget _buildHeaderCell(String text, {bool isHeader = false}) {
    return Container(
      height: 48,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        color: isHeader ? Colors.blue[100] : null,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
