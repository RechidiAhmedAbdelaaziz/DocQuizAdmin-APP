import 'package:admin_app/core/router/abstract_route.dart';
import 'package:admin_app/feature/auth/view/login.screen.dart';

class LoginRoute extends NavigatorRouteBase {
  LoginRoute() : super(LoginScreen.route, child: LoginScreen());
}
