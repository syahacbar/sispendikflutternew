import 'package:flutter/material.dart';
import '../../../models/distrik_model.dart';
import '../../../models/sekolah_model.dart';
import '../../../services/api_service.dart';

class ListSekolahPage extends StatelessWidget {
  const ListSekolahPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final distrik = ModalRoute.of(context)!.settings.arguments as Distrik;

    return Scaffold(
      appBar: AppBar(title: Text('Sekolah di ${distrik.nama}')),
      body: FutureBuilder<List<Sekolah>>(
        future: ApiService.fetchSekolahByDistrik(distrik.kode),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Gagal memuat sekolah: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Belum ada sekolah.'));
          }

          final sekolahList = snapshot.data!;
          return ListView.builder(
            itemCount: sekolahList.length,
            itemBuilder: (context, index) {
              final s = sekolahList[index];
              return Card(
                child: ListTile(
                  title: Text(s.nama),
                  subtitle: Text('${s.jenjang} • ${s.statusSekolah}'),
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('PD: ${s.pesertaDidik}'),
                      Text('Rombel: ${s.rombel}'),
                      Text('Guru: ${s.guru}'),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
