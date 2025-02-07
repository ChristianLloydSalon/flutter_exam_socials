import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_exam/feature/auth/presentation/bloc/auth_options_cubit.dart';
import 'package:flutter_exam/presentation/component/custom_button.dart';
import 'package:flutter_exam/presentation/component/custom_network_image.dart';

class AuthUserHeader extends StatelessWidget {
  const AuthUserHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthOptionsCubit>(
      create: (_) => AuthOptionsCubit(),
      child: const _AuthDetailsView(),
    );
  }
}

class _AuthDetailsView extends StatelessWidget {
  const _AuthDetailsView();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => context.read<AuthOptionsCubit>().show(),
          child: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              return Row(
                children: [
                  _Avatar(imageUrl: state.user.photoURL),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(state.user.username),
                      Text(state.user.id),
                    ],
                  )
                ],
              );
            },
          ),
        ),
        BlocBuilder<AuthOptionsCubit, bool>(
          builder: (context, shown) {
            if (shown) {
              return Column(
                children: [
                  CustomButton(
                    label: 'Logout',
                    foregroundColor: Colors.red,
                    onTap: () {
                      context.read<AuthBloc>().add(const AuthLogoutRequested());
                    },
                  ),
                  CustomButton(
                    label: 'Cancel',
                    foregroundColor: Colors.blue,
                    onTap: () => context.read<AuthOptionsCubit>().hide(),
                  ),
                ],
              );
            }

            return const SizedBox();
          },
        ),
      ],
    );
  }
}

class _Avatar extends StatelessWidget {
  final String imageUrl;

  const _Avatar({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: CustomNetworkImage(
        imageUrl: imageUrl,
        width: 40,
        height: 40,
      ),
    );
  }
}
