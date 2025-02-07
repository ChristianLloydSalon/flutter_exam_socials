import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam/feature/auth/presentation/component/auth_user_header.dart';
import 'package:flutter_exam/feature/social/presentation/component/socials_view.dart';
import 'package:flutter_exam/presentation/component/custom_loading_indicator.dart';

import '../../di/social_service_locator.dart';
import '../bloc/socials_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static String get path => '/';

  static String get name => 'Home';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SocialsBloc>(
      create: (_) => SocialsBloc(socialRepository)
        ..add(
          const SocialsRequested(),
        ),
      child: const Scaffold(
        body: _HomeScreen(),
      ),
    );
  }
}

class _HomeScreen extends StatelessWidget {
  const _HomeScreen();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SocialsBloc, SocialsState>(
      builder: (context, state) {
        if (state.requestStatus.isLoading || state.items.isEmpty) {
          return const Center(
            child: CustomLoadingIndicator(spiel: 'Fetching Data'),
          );
        }

        return const Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              AuthUserHeader(),
              SizedBox(height: 8),
              SocialsView(),
            ],
          ),
        );
      },
    );
  }
}
