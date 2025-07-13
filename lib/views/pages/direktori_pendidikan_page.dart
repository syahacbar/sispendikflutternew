import 'package:flutter/material.dart';
import '../../../models/distrik_model.dart';
import '../../../services/api_service.dart';
// import 'list_sekolah_page.dart';

class DirektoriPendidikanPage extends StatefulWidget {
  const DirektoriPendidikanPage({Key? key}) : super(key: key);

  @override
  State<DirektoriPendidikanPage> createState() =>
      _DirektoriPendidikanPageState();
}

class _DirektoriPendidikanPageState extends State<DirektoriPendidikanPage> {
  late Future<List<Distrik>> _futureDistrik;

  @override
  void initState() {
    super.initState();
    _futureDistrik = ApiService.fetchDistrik();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Direktori Pendidikan')),
      body: FutureBuilder<List<Distrik>>(
        future: _futureDistrik,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Gagal memuat data: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Tidak ada data distrik.'));
          }

          final distrikList = snapshot.data!;
          return ListView.builder(
            itemCount: distrikList.length,
            itemBuilder: (context, index) {
              final d = distrikList[index];
              return Card(
                child: ListTile(
                  title: Text(d.nama),
                  subtitle: Text('Total Sekolah: ${d.totalSekolah}'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/sekolah', arguments: d);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
