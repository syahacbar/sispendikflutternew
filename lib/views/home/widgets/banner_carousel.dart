// lib/views/home/widgets/banner_carousel.dart
import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import '../../../../core/dummy_data.dart';

class BannerCarousel extends StatelessWidget {
  const BannerCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: Swiper(
        itemCount: DummyData.banners.length,
        autoplay: true,
        autoplayDelay: 5000,
        duration: 800,
        pagination: const SwiperPagination(),
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              DummyData.banners[index],
              fit: BoxFit.cover,
              width: double.infinity,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(child: CircularProgressIndicator());
              },
              errorBuilder: (context, error, stackTrace) {
                return const Center(child: Icon(Icons.broken_image, size: 50));
              },
            ),
          );
        },
      ),
    );
  }
}
