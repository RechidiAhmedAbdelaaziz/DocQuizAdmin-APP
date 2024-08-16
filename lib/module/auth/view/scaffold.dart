part of 'login.screen.dart';

class _Scaffold extends StatelessWidget {
  const _Scaffold({
    required Widget logo,
    required Widget form,
    required Widget loginButton,
    required void Function(BuildContext, AuthState) listener,
  })  : _logo = logo,
        _form = form,
        _loginButton = loginButton,
        _listener = listener;

  final Widget _logo;
  final Widget _form;
  final Widget _loginButton;
  final void Function(BuildContext, AuthState) _listener;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: _listener,
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                _logo,
                height(124),
                _form,
                height(35),
                _loginButton,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
