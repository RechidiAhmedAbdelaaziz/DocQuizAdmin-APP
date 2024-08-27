part of 'major.screen.dart';

class _MajorList extends StatelessWidget {
  const _MajorList(this._level);

  final String _level;

  @override
  Widget build(BuildContext context) {
    final majors = context.watch<MajorCubit>().majors;
    return Column(
      children: majors
          .map((major) => _buildMajorItem(
                major,
                () => context.to(
                  CourseRoute(_level, major.name!),
                ),
              ))
          .toList(),
    );
  }

  Widget _buildMajorItem(MajorModel major, VoidCallback showCourses) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
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
          Image.network(
            major.icon ?? '',
            height: 50.h,
            fit: BoxFit.cover,
          ),
          const Spacer(),
          Text(
            major.name!,
            style: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: showCourses,
            icon: const Icon(Icons.arrow_forward_ios, size: 20),
          ),
        ],
      ),
    );
  }
}
