import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_exam/feature/auth/presentation/component/auth_user_header.dart';
import 'package:flutter_exam/feature/auth/presentation/screen/login_screen.dart';
import 'package:flutter_exam/feature/social/presentation/component/socials_view.dart';
import 'package:flutter_exam/presentation/component/custom_loading_indicator.dart';
import 'package:go_router/go_router.dart';

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
      child: BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
        if (state.requestStatus.isSuccess &&
            state.authStatus.isUnauthenticated) {
          context.pushReplacementNamed(LoginScreen.name);
        }
      }, builder: (context, state) {
        return Scaffold(
          body: state.requestStatus.isLoading
              ? const Center(
                  child: CustomLoadingIndicator(spiel: 'Logging out'),
                )
              : const _HomeScreen(),
        );
      }),
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

        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const AuthUserHeader(),
              const SizedBox(height: 8),
              Expanded(
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 300),
                    child: const SocialsView(),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
