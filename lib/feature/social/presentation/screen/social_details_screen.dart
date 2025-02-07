import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_exam/presentation/component/custom_web_view.dart';

import '../../../../presentation/component/custom_button.dart';
import '../../domain/entity/social.dart';

class SocialDetailsScreen extends StatelessWidget {
  const SocialDetailsScreen({
    required this.social,
    super.key,
  });

  final Social social;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(social.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CachedNetworkImage(imageUrl: social.imageUrl),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(social.history),
                  _SocialWebButton(name: social.name, url: social.webUrl),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SocialWebButton extends StatelessWidget {
  const _SocialWebButton({required this.name, required this.url});

  final String name;
  final String url;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      label: 'Visit $name',
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CustomWebView(
              name: name,
              url: url,
            ),
          ),
        );
      },
    );
  }
}
