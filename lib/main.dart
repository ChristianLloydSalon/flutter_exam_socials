import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam/feature/auth/di/auth_service_locator.dart';
import 'package:flutter_exam/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_exam/presentation/route/app_route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => AuthBloc(
              authRepository,
            ),
          ),
        ],
        child: MaterialApp.router(
          routerConfig: appRoute,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
