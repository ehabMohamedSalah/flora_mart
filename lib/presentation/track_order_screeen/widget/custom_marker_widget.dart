import 'package:flutter/material.dart';

class CustomMarkerWidget extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;

  const CustomMarkerWidget({
    super.key,
    required this.label,
    this.icon = Icons.local_florist,
    this.color = Colors.pink,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // الفقاعة العلوية
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20),
          ),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, color: Colors.white, size: 14),
                const SizedBox(width: 4),
                Text(
                  label,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        // أيقونة الموقع
        Icon(Icons.location_on_outlined, color: color, size: 40),
      ],
    );
  }
}
