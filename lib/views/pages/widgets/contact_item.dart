import 'package:flutter/material.dart';

class ContactItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final VoidCallback onTap;

  const ContactItem({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 20, color: Colors.blueGrey),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    value,
                    style: const TextStyle(fontSize: 14, color: Colors.blue),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
