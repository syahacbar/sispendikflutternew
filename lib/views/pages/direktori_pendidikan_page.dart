import 'package:flutter/material.dart';
import '../../models/distrik_model.dart';
import '../../services/api_service.dart';

class DirektoriPendidikanPage extends StatefulWidget {
  const DirektoriPendidikanPage({super.key});

  @override
  State<DirektoriPendidikanPage> createState() =>
      _DirektoriPendidikanPageState();
}

class _DirektoriPendidikanPageState extends State<DirektoriPendidikanPage> {
  Future<List<Distrik>>? distrikFuture;

  @override
  void initState() {
    super.initState();
    distrikFuture = ApiService.fetchDistrik();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Direktori Pendidikan")),
      body: FutureBuilder<List<Distrik>>(
        future: distrikFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Tidak ada data distrik.'));
          } else {
            final distrikList = snapshot.data!;
            return ListView.builder(
              itemCount: distrikList.length,
              itemBuilder: (context, index) {
                final d = distrikList[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: ListTile(
                    title: Text(d.nama),
                    subtitle: Text(
                      'TK: ${d.tk}, KB: ${d.kb}, TPA: ${d.tpa}, SPS: ${d.sps}, PKBM: ${d.pkbm}, SKB: ${d.skb}, SD: ${d.sd}, SMP: ${d.smp}, SMA: ${d.sma}, SMK: ${d.smk}\n'
                      'Total sekolah: ${d.totalSekolah}',
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
