import 'package:admin_app/core/extension/navigator.extension.dart';
import 'package:admin_app/core/shared/widget/space.widget.dart';
import 'package:admin_app/feature/domain/helper/domain.route.dart';
import 'package:admin_app/feature/exam/helper/exam.route.dart';
import 'package:admin_app/feature/home/cubit/home_cubit.dart';
import 'package:admin_app/feature/question/helper/question_list.route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part 'scaffold.dart';
part 'statistics.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..fetchStatistics(),
      child: const _Scaffold(
        statistics: _Statistics(),
      ),
    );
  }
}
