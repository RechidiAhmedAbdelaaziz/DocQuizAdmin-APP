import 'package:flutter/material.dart';

extension AlertDialogExtension on BuildContext {
  Future<void> showAlertDialog({
    required String title,
    String content = '',
    String? confirmText,
    VoidCallback? onConfirm,
    String? cancelText,
    VoidCallback? onCancel,
    bool canPop = true,
  }) async {
    return showDialog(
      context: this,
      builder: (context) {
        return PopScope(
          canPop: canPop,
          child: AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: <Widget>[
              if (cancelText != null)
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    if (onCancel != null) onCancel();
                  },
                  child: Text(
                    cancelText,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              if (confirmText != null)
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    if (onConfirm != null) onConfirm();
                  },
                  child: Text(
                    confirmText,
                    style: const TextStyle(color: Colors.blue),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
