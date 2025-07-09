import 'package:flutter/material.dart';

class PencarianDataPage extends StatelessWidget {
  const PencarianDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Halaman Pencarian Data\n(Fitur filter pencarian sekolah, guru, siswa, dll)',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
