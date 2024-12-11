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
      child: ElevatedButton(
        onPressed: () {
          if (!isLoding &&
              _formKey.currentState?.validate() == true) {
            context.read<LoginCubit>().login();
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.lightBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        child: isLoding
            ? const CircularProgressIndicator(color: AppColors.black)
            : Text(
                'Login',
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 24.spMin,
                  fontWeight: FontWeight.w500,
                ),
              ),
      ),
    );
  }
}
