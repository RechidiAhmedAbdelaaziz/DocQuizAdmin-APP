import 'package:admin_app/core/extension/alertdialog.extenstion.dart';
import 'package:admin_app/core/extension/navigator.extension.dart';
import 'package:admin_app/core/extension/snackbar.extension.dart';
import 'package:admin_app/core/extension/validator.extension.dart';
import 'package:admin_app/module/levels/helpers/major.route.dart';
import 'package:admin_app/module/levels/logic/level.cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part 'scaffold.dart';
part 'level_list.dart';
part 'floating_button.dart';
part 'listener.dart';

class LevelScreen extends StatelessWidget {
  const LevelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LevelCubit()..fetchLevels(),
      child: _Scaffold(
        title: 'Levels',
        levelsList: const _LevelList(),
        floatingActionButton: _FloatingButton(),
        listener: (scaffodl) => _Listener(scaffodl),
      ),
    );
  }
}
