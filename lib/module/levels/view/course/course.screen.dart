import 'package:admin_app/core/extension/alertdialog.extenstion.dart';
import 'package:admin_app/core/extension/snackbar.extension.dart';
import 'package:admin_app/module/levels/logic/course.cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:admin_app/core/extension/validator.extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/level.model.dart';

part 'scaffold.dart';
part 'course_list.dart';
part 'floating_button.dart';
part 'listener.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen(this._level, this._major, {super.key});

  final String _level;
  final String _major;


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CourseCubit(_level, _major)..fetchCourses(),
      child: _Scaffold(
        title: "Courses for $_major",
        courseList: _CourseList(),
        floatingActionButton: _FloatingButton(),
        builder: (scaffold) => _Listener(scaffold),
      ),
    );
  }
}
