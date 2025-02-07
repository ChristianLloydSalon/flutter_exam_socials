import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_exam/feature/auth/presentation/screen/login_screen.dart';
import 'package:flutter_exam/feature/social/presentation/screen/home_screen.dart';
import 'package:go_router/go_router.dart';

final appRoute = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: HomeScreen.path,
      name: HomeScreen.name,
      builder: (_, __) => const HomeScreen(),
    ),
    GoRoute(
      path: LoginScreen.path,
      name: LoginScreen.name,
      builder: (_, __) => const LoginScreen(),
    ),
  ],
  redirect: (context, state) {
    final isUnauthenticated =
        context.read<AuthBloc>().state.authStatus.isUnauthenticated;

    if (isUnauthenticated) {
      return LoginScreen.path;
    }

    return null;
  },
);
