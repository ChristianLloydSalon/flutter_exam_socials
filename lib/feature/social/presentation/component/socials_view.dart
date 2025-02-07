import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam/feature/social/presentation/component/social_card.dart';
import 'package:flutter_exam/feature/social/presentation/screen/social_details_screen.dart';

import '../../domain/entity/social.dart';
import '../bloc/socials_bloc.dart';

class SocialsView extends StatelessWidget {
  const SocialsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<SocialsBloc, SocialsState, List<Social>>(
      selector: (state) => state.items,
      builder: (context, items) {
        return GridView.builder(
          shrinkWrap: true,
          itemCount: items.length + 1,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
          ),
          itemBuilder: (context, index) {
            if (index == items.length) {
              return const _MoreButton();
            }

            final social = items[index];

            return SocialCard(
              iconUrl: social.iconUrl,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SocialDetailsScreen(
                      social: social,
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}

class _MoreButton extends StatelessWidget {
  const _MoreButton();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          color: Colors.amber,
        ),
        child: const Icon(
          Icons.exit_to_app_rounded,
          size: 80,
          color: Colors.white,
        ),
      ),
    );
  }
}
