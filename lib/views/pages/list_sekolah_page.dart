import 'package:flutter/material.dart';

class ListSekolahPage extends StatelessWidget {
  final String distrik;

  const ListSekolahPage({super.key, required this.distrik});

  @override
  Widget build(BuildContext context) {
    // Simulasi data sekolah
    final sekolah = [
      'SD Negeri 1 $distrik',
      'SMP Negeri 1 $distrik',
      'SMA Negeri 1 $distrik',
    ];

    return Scaffold(
      appBar: AppBar(title: Text('Daftar Sekolah di $distrik')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: sekolah.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(sekolah[index]),
              leading: const Icon(Icons.school),
            ),
          );
        },
      ),
    );
  }
}
