import 'package:admin_app/core/extension/navigator.extension.dart';
import 'package:flutter/material.dart';

extension AlertDialogExtension on BuildContext {
  Future<T?> showDialogBox<T>({
    required String title,
    String body = '',
    Widget? content,
    String? confirmText,
    void Function(VoidCallback)? onConfirm,
    String? cancelText,
    void Function(VoidCallback)? onCancel,
    bool canPop = true,
  }) async {
    return showDialog<T>(
      context: this,
      builder: (context) {
        return PopScope(
          canPop: canPop,
          child: AlertDialog(
            title: Text(title),
            content: content ?? Text(body),
            actions: <Widget>[
              if (cancelText != null)
                TextButton(
                  onPressed: () {
                    if (onCancel != null) onCancel(context.back);
                  },
                  child: Text(
                    cancelText,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              if (confirmText != null)
                TextButton(
                  onPressed: () {
                    if (onConfirm != null) onConfirm(context.back);
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

  Future<T?> showPopUp<T>({
    required Widget content,
  }) async {
    return showDialog<T>(
      context: this,
      builder: (context) {
        return Stack(
          alignment: Alignment.center,
          children: [
            content,
          ],
        );
      },
    );
  }

  void dialogWithResult<T>({
    required Widget child,
    required void Function(T result) onResult,
    void Function()? onError,
  }) async {
    final result = await showDialog<T>(
      context: this,
      builder: (context) {
        return child;
      },
    );

    (result != null) ? onResult(result) : onError?.call();
  }
}
