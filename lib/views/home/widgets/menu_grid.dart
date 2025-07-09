import 'package:flutter/material.dart';
import '../../../core/dummy_data.dart';

class MenuGrid extends StatelessWidget {
  const MenuGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: DummyData.menuItems.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 0.8,
      ),
      itemBuilder: (context, index) {
        final item = DummyData.menuItems[index];
        return _MenuItem(
          icon: item['icon'],
          label: item['label'],
          color: item['color'],
        );
      },
    );
  }
}

class _MenuItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const _MenuItem({
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 58,
          height: 58,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, size: 28, color: color),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
