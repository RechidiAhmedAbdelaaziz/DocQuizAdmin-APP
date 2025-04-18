part of 'login.screen.dart';

class _LoginButton extends StatelessWidget {
  const _LoginButton(this._formKey);

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    final isLoding = context
        .watch<LoginCubit>()
        .state
        .maybeWhen(orElse: () => false, loginInProgress: () => true);
    return SizedBox(
      height: 60.h,
      width: 354.w,
      child: AppButton.primary(
        onPressed: () {
          if (!isLoding &&
              _formKey.currentState?.validate() == true) {
            context.read<LoginCubit>().login();
          }
        },
        isLoading: (_) => isLoding,
        text: "Login",
      ),
    );
  }
}
