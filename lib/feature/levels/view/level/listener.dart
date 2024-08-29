part of 'level.screen.dart';

class _Listener extends StatelessWidget {
  const _Listener(this._child);

  final Widget _child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<LevelCubit, LevelState>(
      listener: (context, state) {
        state.whenOrNull(
          apiError: (error) => context.showErrorSnackBar(error),
          levelCreated: () =>
              context.showSuccessSnackBar('Level created'),
        );
      },
      child: _child,
    );
  }
}
