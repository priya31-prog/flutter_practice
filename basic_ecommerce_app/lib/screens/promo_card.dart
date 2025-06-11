import 'package:flutter/material.dart';

class PromoCard extends StatelessWidget {
  final String title;
  final String? subtitle;

  const PromoCard({super.key, required this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Theme.of(
          context,
        ).colorScheme.secondary.withAlpha(30), // match dark theme
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: const Color(0xFF5CE1E6),
              fontWeight: FontWeight.bold,
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
    );
  }
}
