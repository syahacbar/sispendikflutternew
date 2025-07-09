// lib/views/home/widgets/news_section.dart
import 'package:flutter/material.dart';
import '../../../core/dummy_data.dart';

class NewsSection extends StatelessWidget {
  const NewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final news = DummyData.news;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Berita & Informasi',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        ListView.separated(
          itemCount: news.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final item = news[index];
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    item['image']!,
                    width: 100,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['title']!,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        item['date']!,
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
