import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    required this.imageUrl,
    this.width,
    this.height,
    super.key,
  });

  final String imageUrl;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: BoxFit.cover,
      placeholder: (context, url) => Container(
        width: width,
        height: height,
        color: Colors.black12,
        alignment: Alignment.center,
        child: const CircularProgressIndicator(),
      ),
      errorWidget: (context, url, error) => Container(
        width: 40,
        height: 40,
        color: Colors.grey.shade300,
        child: const Icon(Icons.error, color: Colors.red),
      ),
    );
  }
}
