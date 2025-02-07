import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth_form_bloc.dart';

class LoginTextField extends StatelessWidget {
  const LoginTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AuthFormBloc, AuthFormState, String>(
      selector: (state) => state.usernameError,
      builder: (context, error) {
        return TextFormField(
          decoration: InputDecoration(
            hintText: 'Username',
            border: const OutlineInputBorder(),
            error: error.isNotEmpty ? _ErrorText(error: error) : null,
          ),
          onChanged: (value) {
            context.read<AuthFormBloc>().add(
                  AuthFormUsernameChanged(value),
                );
          },
        );
      },
    );
  }
}

class _ErrorText extends StatelessWidget {
  const _ErrorText({required this.error});

  final String error;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        error,
        style: const TextStyle(
          color: Colors.red,
        ),
      ),
    );
  }
}
