part of 'course.screen.dart';

class _Listener extends StatelessWidget {
  const _Listener(this._child);

  final Widget _child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CourseCubit, CourseState>(
      listener: (context, state) {
        state.whenOrNull(
          courseAdded: () => context
              .showSuccessSnackBar('Course added successfully'),
          apiError: (message) => context.showErrorSnackBar(message),
        );
      },
      child: _child,
    );
  }
}
