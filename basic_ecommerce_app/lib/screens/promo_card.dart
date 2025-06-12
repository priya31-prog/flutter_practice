import 'package:flutter/material.dart';

class PromoCard extends StatelessWidget {
  final String title;
  final String? subtitle;

  const PromoCard({super.key, required this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: Theme.of(
            context,
          ).colorScheme.secondary.withAlpha(50), // match dark theme
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: const Color(0xFF5CE1E6),
                fontWeight: FontWeight.bold,
                fontSize: 33,
              ),
            ),
            const SizedBox(height: 4),
            subtitle != null
                ? Text(
                  subtitle ?? '',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: const Color(0xFF5CE1E6),
                    fontWeight: FontWeight.w500,
                  ),
                )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
