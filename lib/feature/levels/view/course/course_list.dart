part of 'course.screen.dart';

class _CourseList extends StatelessWidget {
  const _CourseList(this._showQuestions);

  final void Function(String) _showQuestions;

  @override
  Widget build(BuildContext context) {
    final courseList = context.watch<CourseCubit>().courses;
    return Column(
      children: courseList
          .map(
            (course) => _buildCourseItem(
                course, () => _showQuestions(course.title!)),
          )
          .toList(),
    );
  }

  Widget _buildCourseItem(
      CourseModel course, VoidCallback showQuestions) {
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
          // $ icon for course not free
          course.isFree!
              ? const SizedBox()
              : const Icon(Icons.lock, size: 30),
          const Spacer(),
          Text(
            course.title!,
            style: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: showQuestions,
            icon: const Icon(Icons.arrow_forward_ios, size: 20),
          ),
        ],
      ),
    );
  }
}
