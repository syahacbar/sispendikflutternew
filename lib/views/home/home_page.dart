import 'package:flutter/material.dart';
import '../../../core/dummy_data.dart';
import 'widgets/banner_carousel.dart';
import 'widgets/menu_grid.dart';
import 'widgets/statistik_section.dart';
import 'widgets/news_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header biru + banner
              Container(
                decoration: const BoxDecoration(
                  color: Color(0xFF002F6C),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(24),
                  ),
                ),
                child: Column(
                  children: const [
                    SizedBox(height: 16),
                    BannerCarousel(),
                    SizedBox(
                      height: 40,
                    ), // Spacer untuk memberi ruang ke search box
                  ],
                ),
              ),

              // Search box mengambang sebagian ke atas banner
              Transform.translate(
                offset: const Offset(0, -30),
                child: const _SearchBox(),
              ),

              const SizedBox(height: 16),
              const MenuGrid(),
              const SizedBox(height: 16),
              const StatistikSection(),
              const SizedBox(height: 20),
              const NewsSection(),
            ],
          ),
        ),
      ),
    );
  }
}

class _SearchBox extends StatelessWidget {
  const _SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(30),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Cari informasi layanan ...',
          prefixIcon: const Icon(Icons.search),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 20,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
