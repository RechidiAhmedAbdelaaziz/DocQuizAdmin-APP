import 'dart:io';

import 'package:admin_app/core/di/container.dart';
import 'package:admin_app/core/extension/alertdialog.extenstion.dart';
import 'package:admin_app/core/extension/navigator.extension.dart';
import 'package:admin_app/core/extension/snackbar.extension.dart';
import 'package:admin_app/core/extension/validator.extension.dart';
import 'package:admin_app/core/helpers/picker.helper.dart';
import 'package:admin_app/feature/levels/data/models/level.model.dart';
import 'package:admin_app/feature/levels/helpers/course.route.dart';
import 'package:admin_app/feature/levels/logic/major.cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part 'scaffold.dart';
part 'major_list.dart';
part 'floating_button.dart';
part 'listener.dart';

class MajorScreen extends StatelessWidget {
  const MajorScreen(this._level, {super.key});

  final String _level;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MajorCubit(_level)..fetchMajors(),
      child: _Scaffold(
        title: 'Majors for $_level',
        majorList: _MajorList(_level),
        floatingActionButton: const _FloatingButton(),
        builder: (scaffold) => _Listener(scaffold),
      ),
    );
  }
}
