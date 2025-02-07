import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';

import '../../../../presentation/component/custom_alert_dialog.dart';
import '../../domain/entity/auth_request.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_form_bloc.dart';

class OtpDialog extends StatelessWidget {
  const OtpDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthFormBloc, AuthFormState>(
      builder: (context, state) {
        return CustomAlertDialog(
          title: "Verify It's You",
          content: const _OtpInput(),
          onConfirm: () {
            if (state.otpError.isNotEmpty || state.usernameError.isNotEmpty) {
              return;
            }

            context.read<AuthBloc>().add(
                  AuthLoginRequested(
                    AuthRequest(
                      username: state.username,
                      otp: state.otp,
                    ),
                  ),
                );

            context.read<AuthFormBloc>().add(const AuthFormCleared());

            Navigator.pop(context);
          },
          confirmationText: 'Enter',
        );
      },
    );
  }
}

class _OtpInput extends StatelessWidget {
  const _OtpInput();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('Please enter your 6 digit PIN'),
        const SizedBox(height: 10),
        Material(
          type: MaterialType.transparency,
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: Pinput(
              length: 6,
              onChanged: (value) {
                context.read<AuthFormBloc>().add(AuthFormOtpChanged(value));
              },
            ),
          ),
        ),
      ],
    );
  }
}
