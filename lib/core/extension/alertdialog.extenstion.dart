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
                    onCancel != null
                        ? onCancel(context.back)
                        : context.back();
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

  /// Show a dialog with the given [child] widget.
  /// [T] is the type of the result that will be returned when the dialog is closed.
  Future<T?> dialog<T>({required Widget child}) {
    return showDialog<T>(
      context: this,
      builder: (_) => Stack(
        alignment: Alignment.center,
        children: [
          Material(color: Colors.transparent, child: child),
        ],
      ),
    );
  }

  /// Show a dialog with the given [child] widget.
  /// [T] is the type of the result that will be returned when the dialog is closed.
  /// [onResult] is called when the dialog is closed with a result.
  /// [onError] is called when the dialog is closed without a result.
  Future<void> dialogWith<T>({
    required Widget child,
    required void Function(T) onResult,
    VoidCallback? onError,
  }) async {
    final result = await dialog<T>(child: child);
    result != null ? onResult(result) : onError?.call();
  }
}
