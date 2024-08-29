// ignore_for_file: must_be_immutable

part of 'question.screen.dart';

class _Field extends StatefulWidget {
  _Field(this._field);

  FieldModel? _field;

  @override
  State<_Field> createState() => _FieldState();
}

class _FieldState extends State<_Field> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<QuestionCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          ' Field',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        height(8),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...[
                  "Level :  ${widget._field?.level}",
                  "Major :  ${widget._field?.major}",
                  "Course : ${widget._field?.course}",
                ].map(
                  (e) => Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 7),
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      e,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            IconButton(
              onPressed: () async {
                final field =
                    await context.showBottomSheet<FieldModel>(
                  child: const _Levels(),
                );
                if (field != null) {
                  setState(() {
                    widget._field = field;
                  });
                  cubit.setField(field);
                }
              },
              icon: const Icon(Icons.edit),
            ),
          ],
        ),
      ],
    );
  }
}

class _Levels extends StatelessWidget {
  const _Levels();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LevelCubit()..fetchLevels(),
      child: Builder(builder: (context) {
        final levels = context.watch<LevelCubit>().levels;
        final back = context.back;
        return SingleChildScrollView(
          child: Column(
            children: [
              ...levels.map(
                (e) => _SelcetItem(
                  title: e.name!,
                  onTap: () async {
                    final field =
                        await context.showBottomSheet<FieldModel>(
                      child: _Majors(e.name!),
                    );
                    if (field != null) {
                      back(field);
                    }
                  },
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

class _Majors extends StatelessWidget {
  const _Majors(this.level);

  final String level;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MajorCubit(level)..fetchMajors(),
      child: Builder(builder: (context) {
        final majors = context.watch<MajorCubit>().majors;
        final back = context.back;
        return SingleChildScrollView(
          child: Column(
            children: [
              ...majors.map(
                (e) => _SelcetItem(
                  title: e.name!,
                  onTap: () async {
                    final field =
                        await context.showBottomSheet<FieldModel>(
                      child: _Courses(level, e.name!),
                    );
                    if (field != null) {
                      back(field);
                    }
                  },
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

class _Courses extends StatelessWidget {
  const _Courses(this.level, this.major);

  final String level;
  final String major;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CourseCubit(level, major)..fetchCourses(),
      child: Builder(builder: (context) {
        final courses = context.watch<CourseCubit>().courses;
        final back = context.back;
        return SingleChildScrollView(
          child: Column(
            children: [
              ...courses.map(
                (e) => _SelcetItem(
                  title: e.title!,
                  onTap: () {
                    back(FieldModel(
                      level: level,
                      major: major,
                      course: e.title,
                    ));
                  },
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

class _SelcetItem extends StatelessWidget {
  const _SelcetItem({
    required this.title,
    required this.onTap,
  });

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          padding:
              EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          margin:
              EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              const Icon(Icons.school, size: 30),
              const Spacer(),
              Text(
                title,
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: onTap,
                icon: const Icon(Icons.arrow_forward_ios, size: 20),
              ),
            ],
          ),
        ));
  }
}
