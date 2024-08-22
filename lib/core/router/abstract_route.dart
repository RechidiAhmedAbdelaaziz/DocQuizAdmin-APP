import 'package:admin_app/core/di/container.dart';
import 'package:admin_app/core/router/navigator.dart';
import 'package:flutter/material.dart';

abstract class AbstractRoute {
  AbstractRoute(this._path, {required Widget child}) : _child = child;

  final String _path;
  final Widget _child;
  AppNavigator _navigator = locator<NormalNavigator>();

  String get path => _path;

  set navigator(AppNavigator navigator) {
    _navigator = navigator;
  }

  MaterialPageRoute<D> buildRoute<D>() =>
      _navigator.buildRoute(_path, _child);
}

// //Example TestScreen
// class TestWidget extends StatelessWidget {
//   static const route = '/test';
//   const TestWidget({super.key, required this.title});

//   final String title;

//   @override
//   Widget build(BuildContext context) {
//     context.to(TestRoute(title: "RECHIDI Ahmed"));
//     return const Placeholder();
//   }
// }

// //Example TestRoute
// class TestRoute extends AbstractRoute<TestWidget> {
//   TestRoute({required String title})
//       : super(
//           TestWidget.route,
//           child: TestWidget(title: title),
//         );
// }
