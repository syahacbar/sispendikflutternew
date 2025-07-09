import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';

class FormPengaduanPage extends StatefulWidget {
  const FormPengaduanPage({super.key});

  @override
  State<FormPengaduanPage> createState() => _FormPengaduanPageState();
}

class _FormPengaduanPageState extends State<FormPengaduanPage> {
  final _formKey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _emailController = TextEditingController();
  final _hpController = TextEditingController();
  final _isiController = TextEditingController();
  String? _selectedKategori;
  File? _lampiran;

  final List<String> _kategoriList = [
    'Fasilitas Sekolah',
    'Tenaga Pengajar (Guru)',
    'Kurangnya Sarana Prasarana',
    'Kekerasan / Perundungan',
    'Lainnya',
  ];

  Future<void> _pickLampiran() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf', 'doc', 'docx'],
    );

    if (result != null && result.files.single.path != null) {
      setState(() {
        _lampiran = File(result.files.single.path!);
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Simulasi kirim
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Pengaduan berhasil dikirim')),
      );
      _formKey.currentState!.reset();
      setState(() {
        _selectedKategori = null;
        _lampiran = null;
      });
    }
  }

  @override
  void dispose() {
    _namaController.dispose();
    _emailController.dispose();
    _hpController.dispose();
    _isiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Form Pengaduan')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Laporkan keluhan atau permasalahan seputar pendidikan di Teluk Bintuni',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),

              // Nama
              TextFormField(
                controller: _namaController,
                decoration: const InputDecoration(
                  labelText: 'Nama Pelapor',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Nama tidak boleh kosong' : null,
              ),
              const SizedBox(height: 16),

              // Email
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email (opsional)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              // Nomor HP
              TextFormField(
                controller: _hpController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: 'No. HP / WhatsApp',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Nomor HP tidak boleh kosong' : null,
              ),
              const SizedBox(height: 16),

              // Kategori
              DropdownButtonFormField<String>(
                value: _selectedKategori,
                items: _kategoriList
                    .map(
                      (kategori) => DropdownMenuItem(
                        value: kategori,
                        child: Text(kategori),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedKategori = value;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Kategori Pengaduan',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value == null ? 'Pilih kategori pengaduan' : null,
              ),
              const SizedBox(height: 16),

              // Isi pengaduan
              TextFormField(
                controller: _isiController,
                maxLines: 5,
                decoration: const InputDecoration(
                  labelText: 'Isi Pengaduan',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Isi pengaduan tidak boleh kosong' : null,
              ),
              const SizedBox(height: 16),

              // Lampiran
              OutlinedButton.icon(
                icon: const Icon(Icons.attach_file),
                label: const Text('Pilih Lampiran'),
                onPressed: _pickLampiran,
              ),
              if (_lampiran != null)
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    'Lampiran: ${_lampiran!.path.split('/').last}',
                    style: const TextStyle(fontSize: 13),
                  ),
                ),

              const SizedBox(height: 24),

              // Tombol Kirim
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.send),
                  label: const Text('Kirim Pengaduan'),
                  onPressed: _submitForm,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
