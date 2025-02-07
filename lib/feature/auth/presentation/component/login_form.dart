import 'package:flutter/material.dart';
import 'package:flutter_exam/feature/auth/presentation/component/login_button.dart';
import 'package:flutter_exam/feature/auth/presentation/component/login_text_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        LoginTextField(),
        SizedBox(height: 8),
        LoginButton(),
      ],
    );
  }
}
