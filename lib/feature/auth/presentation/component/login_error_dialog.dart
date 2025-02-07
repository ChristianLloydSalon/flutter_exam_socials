import 'package:flutter/material.dart';
import 'package:flutter_exam/presentation/component/custom_alert_dialog.dart';

class LoginErrorDialog extends StatelessWidget {
  const LoginErrorDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomAlertDialog(
      title: "Verify It's You",
      content: Text('Login Failed, please try again'),
    );
  }
}
