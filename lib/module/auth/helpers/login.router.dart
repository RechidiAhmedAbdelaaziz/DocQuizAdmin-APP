import 'package:admin_app/core/router/abstract_route.dart';
import 'package:admin_app/module/auth/view/login.screen.dart';

class LoginRoute extends AbstractRoute {
  LoginRoute() : super(LoginScreen.route, child: LoginScreen());
}
