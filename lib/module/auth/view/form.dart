part of 'login.screen.dart';

class _Form extends StatelessWidget {
  const _Form(this._formKey);

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    final emailController = context.read<AuthCubit>().emailController;
    final passwordController =
        context.read<AuthCubit>().passwordController;

    return SizedBox(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 38.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppInputeField(
                controller: emailController,
                hint: 'Email',
                keyboardType: TextInputType.emailAddress,
                validator: (value) => value.isValidEmail,
              ),
              height(20),
              AppInputeField(
                controller: passwordController,
                hint: 'Password',
                obscureText: true,
                validator: (value) => value.isStrongPassword,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
