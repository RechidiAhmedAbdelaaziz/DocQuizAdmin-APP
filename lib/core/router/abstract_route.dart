import 'package:flutter/material.dart';

abstract class AbstractRoute<T> {
  AbstractRoute(this._path, {required Widget child}) : _child = child;

  final String _path;
  final Widget _child;

  String get path => _path;

  MaterialPageRoute<D> buildRoute<D>() {
    return MaterialPageRoute(
      settings: RouteSettings(name: _path),
      builder: (_) => _child,
    );
  }
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
