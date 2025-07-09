import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'widgets/contact_item.dart';

class TentangPage extends StatelessWidget {
  const TentangPage({super.key});

  void _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tentang Aplikasi'),
        backgroundColor: const Color(0xFF002F6C),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // LOGO & JUDUL
            Center(
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/logosispendikbintuni.png',
                    width: 200,
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 12),

                  Container(width: 60, height: 4, color: Colors.blueAccent),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // DESKRIPSI APLIKASI
            const Text(
              'Aplikasi Sistem Informasi Pendidikan Kabupaten Teluk Bintuni dirancang untuk menyediakan informasi yang transparan, akurat, dan terkini terkait data pendidikan di wilayah ini. Aplikasi ini menjadi jembatan antara masyarakat, sekolah, dan pemerintah daerah.',
              style: TextStyle(fontSize: 16, height: 1.5),
              textAlign: TextAlign.justify,
            ),

            const SizedBox(height: 32),
            const Divider(),

            // TUJUAN
            const Text(
              'Tujuan',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            const Text(
              '• Menyediakan data pendidikan secara digital dan mudah diakses.\n'
              '• Meningkatkan transparansi dan akuntabilitas pendidikan.\n'
              '• Memberikan sarana pelaporan dan pengaduan masyarakat.\n'
              '• Mendukung perencanaan dan pengambilan kebijakan berbasis data.',
              style: TextStyle(fontSize: 16, height: 1.5),
            ),

            const SizedBox(height: 32),
            Center(
              child: ElevatedButton.icon(
                onPressed: () =>
                    _launchUrl('https://dinaspendidikan.bintunikab.go.id'),
                icon: const Icon(Icons.language),
                label: const Text('Kunjungi Website'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF002F6C),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 32),
            const Divider(),

            // HUBUNGI KAMI
            const Text(
              'Hubungi Kami',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            Row(
              children: [
                ClipOval(
                  child: Image.asset(
                    'assets/images/logobintuni.png',
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Text(
                    'Dinas Pendidikan Kabupaten Teluk Bintuni',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            ContactItem(
              icon: Icons.phone,
              label: 'Telepon',
              value: '(0984) 123456',
              onTap: () => _launchUrl('tel:0984123456'),
            ),
            ContactItem(
              icon: Icons.email,
              label: 'Email',
              value: 'dinas.pendidikan@bintunikab.go.id',
              onTap: () =>
                  _launchUrl('mailto:dinas.pendidikan@bintunikab.go.id'),
            ),
            ContactItem(
              icon: Icons.location_on,
              label: 'Alamat',
              value: 'Jl. Pendidikan No. 1, Bintuni, Papua Barat',
              onTap: () => _launchUrl('https://goo.gl/maps/ZnR8ExZHDwTxPz6t6'),
            ),

            const SizedBox(height: 24),
            const Divider(),

            // SOSIAL MEDIA
            const Text(
              'Ikuti Media Sosial Kami',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            Row(
              children: [
                IconButton(
                  icon: const FaIcon(
                    FontAwesomeIcons.facebook,
                    color: Color(0xFF1877F2),
                  ),
                  onPressed: () =>
                      _launchUrl('https://facebook.com/dinaspendidikanbintuni'),
                ),
                IconButton(
                  icon: const FaIcon(
                    FontAwesomeIcons.instagram,
                    color: Color(0xFFE4405F),
                  ),
                  onPressed: () => _launchUrl(
                    'https://instagram.com/dinaspendidikanbintuni',
                  ),
                ),
                IconButton(
                  icon: const FaIcon(
                    FontAwesomeIcons.twitter,
                    color: Color(0xFF1DA1F2),
                  ),
                  onPressed: () =>
                      _launchUrl('https://twitter.com/dispendikbintuni'),
                ),
                IconButton(
                  icon: const FaIcon(
                    FontAwesomeIcons.youtube,
                    color: Color(0xFFFF0000),
                  ),
                  onPressed: () =>
                      _launchUrl('https://youtube.com/@dispendikbintuni'),
                ),
              ],
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
