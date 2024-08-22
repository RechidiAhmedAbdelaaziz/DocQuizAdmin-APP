part of 'major.screen.dart';

class _Listener extends StatelessWidget {
  const _Listener(this._child);

  final Widget _child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<MajorCubit, MajorState>(
      listener: (context, state) {
        state.whenOrNull(
          majorAdded: () =>
              context.showSuccessSnackBar('Major added successfully'),
          apiError: (message) => context.showErrorSnackBar(message),
        );
      },
      child: _child,
    );
  }
}
