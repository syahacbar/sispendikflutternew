import 'package:flutter/material.dart';
import 'widgets/grafik_sekolah_per_jenjang.dart';
import 'widgets/stat_card.dart';
import 'widgets/grafik_ptk_per_jenjang.dart';
import 'widgets/grafik_kualifikasi_guru.dart';
import 'widgets/tabel_sebaran_sekolah.dart';
import 'widgets/grafik_sarana_prasarana.dart';

class StatistikPendidikanPage extends StatefulWidget {
  const StatistikPendidikanPage({super.key});

  @override
  State<StatistikPendidikanPage> createState() =>
      _StatistikPendidikanPageState();
}

class _StatistikPendidikanPageState extends State<StatistikPendidikanPage> {
  String selectedSource = 'Dapodik';
  final List<String> sources = [
    'Dapodik',
    'EMIS Kemenag',
    'Disdik Teluk Bintuni',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Statistik Pendidikan'),
        backgroundColor: const Color(0xFF002F6C),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Dropdown sumber data
            DropdownButtonFormField<String>(
              value: selectedSource,
              items: sources.map((source) {
                return DropdownMenuItem(value: source, child: Text(source));
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() => selectedSource = value);
                }
              },
              decoration: const InputDecoration(
                labelText: 'Pilih Sumber Data',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // Statistik Pendidikan
            const Text(
              'Statistik Pendidikan',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: const [
                StatCard(title: 'Jumlah Sekolah', value: '78'),
                StatCard(title: 'Pendidik / Guru', value: '312'),
                StatCard(title: 'Tenaga Kependidikan', value: '94'),
                StatCard(title: 'Jumlah Siswa', value: '4150'),
              ],
            ),

            const SizedBox(height: 24),

            // Grafik Placeholder
            const GrafikSekolahPerJenjang(),
            const SizedBox(height: 24),
            const GrafikPTKPerJenjang(),
            const SizedBox(height: 24),
            const GrafikKualifikasiGuru(),
            const SizedBox(height: 24),
            const GrafikSaranaPrasarana(), // <-- ini bagian baru
            SizedBox(height: 24),
            const SizedBox(height: 24),
            TabelSebaranSekolah(),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
