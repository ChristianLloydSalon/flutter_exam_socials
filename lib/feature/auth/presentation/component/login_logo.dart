import 'package:flutter/material.dart';
import 'package:flutter_exam/core/constant/app_assets.dart';

class LoginLogo extends StatelessWidget {
  const LoginLogo({super.key});

  static final List<String> _logos = [
    AppAsset.youtube,
    AppAsset.spotify,
    AppAsset.facebook,
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double maxWidth = constraints.maxWidth;
        double iconSize = maxWidth * 0.3;
        double overlapOffsetX = iconSize * 0.6;
        double overlapOffsetY = iconSize * 0.2;

        final double totalWidth =
            iconSize + (_logos.length - 1) * overlapOffsetX;
        final double totalHeight =
            iconSize + (_logos.length - 1) * overlapOffsetY;

        return SizedBox(
          width: maxWidth,
          height: totalHeight,
          child: Stack(
            alignment: Alignment.center,
            children: List.generate(_logos.length, (index) {
              return Positioned(
                left: (maxWidth - totalWidth) / 2 + index * overlapOffsetX,
                top: index * overlapOffsetY,
                child: _IconBox(
                  imagePath: _logos[index],
                  size: iconSize,
                ),
              );
            }),
          ),
        );
      },
    );
  }
}

class _IconBox extends StatelessWidget {
  const _IconBox({
    required this.imagePath,
    required this.size,
  });

  final String imagePath;
  final double size;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(size * 0.2),
      child: Image.asset(
        imagePath,
        width: size,
        height: size,
      ),
    );
  }
}
