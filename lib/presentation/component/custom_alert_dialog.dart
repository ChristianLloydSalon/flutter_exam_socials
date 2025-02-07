import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    required this.title,
    required this.content,
    this.onConfirm,
    this.confirmationText,
    super.key,
  });

  final String title;
  final Widget content;
  final String? confirmationText;

  final VoidCallback? onConfirm;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(title),
      content: content,
      actions: [
        if (onConfirm != null) ...[
          _AlertDialogButton(
            onTap: () => onConfirm?.call(),
            text: 'Enter',
            textColor: Colors.green,
          ),
        ],
        _AlertDialogButton(
          onTap: () {
            Navigator.pop(context);
          },
          text: 'Close',
          textColor: Colors.red,
        )
      ],
    );
  }
}

class _AlertDialogButton extends StatelessWidget {
  const _AlertDialogButton({
    required this.onTap,
    required this.text,
    required this.textColor,
  });

  final VoidCallback onTap;
  final String text;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,
              style: TextStyle(
                color: textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
