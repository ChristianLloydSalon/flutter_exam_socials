import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam/feature/auth/presentation/component/login_error_dialog.dart';
import 'package:flutter_exam/feature/auth/presentation/component/login_form.dart';
import 'package:flutter_exam/feature/auth/presentation/component/login_logo.dart';
import 'package:flutter_exam/feature/social/presentation/screen/home_screen.dart';
import 'package:flutter_exam/presentation/component/custom_loading_indicator.dart';
import 'package:go_router/go_router.dart';

import '../bloc/auth_bloc.dart';
import '../bloc/auth_form_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static String get path => '/login';

  static String get name => 'Login';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthFormBloc(),
      child: Scaffold(
        body: BlocConsumer<AuthBloc, AuthState>(
          buildWhen: (prev, curr) =>
              prev.requestStatus.isLoading != curr.requestStatus.isLoading,
          listener: (context, state) {
            if (state.authStatus.isAuthenticated &&
                state.requestStatus.isSuccess) {
              context.pushReplacementNamed(HomeScreen.name);
            }

            if (state.requestStatus.isError) {
              showDialog(
                context: context,
                builder: (context) => const LoginErrorDialog(),
              );
            }
          },
          builder: (context, state) {
            if (state.requestStatus.isLoading) {
              return const Center(
                child: CustomLoadingIndicator(spiel: 'Logging in'),
              );
            }

            return Center(
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 300),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LoginLogo(),
                      SizedBox(height: 80),
                      LoginForm(),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
