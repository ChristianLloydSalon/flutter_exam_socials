import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SocialCard extends StatelessWidget {
  const SocialCard({
    required this.iconUrl,
    required this.onTap,
    super.key,
  });

  final String iconUrl;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
        child: CachedNetworkImage(
          imageUrl: iconUrl,
        ),
      ),
    );
  }
}
