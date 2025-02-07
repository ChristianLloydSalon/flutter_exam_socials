import 'package:flutter/material.dart';
import 'package:flutter_exam/presentation/component/custom_network_image.dart';

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
        child: CustomNetworkImage(
          imageUrl: iconUrl,
          width: 40,
          height: 40,
        ),
      ),
    );
  }
}
