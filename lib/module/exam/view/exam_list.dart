part of 'exam.screen.dart';

class _ExamList extends StatelessWidget {
  const _ExamList();

  @override
  Widget build(BuildContext context) {
    final exams = context.watch<ExamCubit>().exams;
    return Column(
      children: [
        height(20),
        ...exams.map((exam) => _ExamItem(exam)),
      ],
    );
  }
}

class _ExamItem extends StatelessWidget {
  const _ExamItem(this._exam);

  final ExamModel _exam;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 16.w),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTitle(_exam.title!),
              height(12),
              Row(
                children: [
                  _buildQuestionCount(_exam.questions!),
                  width(35),
                  _buildTime(_exam.time!),
                ],
              ),
            ],
          ),
          _buildForwardButton(
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionCount(num questions) {
    return Row(
      children: [
        const Icon(Icons.quiz_rounded, size: 30),
        width(5),
        Text(
          questions.toString(),
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Text _buildTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 22.sp,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  IconButton _buildForwardButton({
    required void Function() onPressed,
  }) {
    return IconButton(
      onPressed: onPressed,
      icon: const Icon(Icons.arrow_forward_ios_rounded),
    );
  }

  Widget _buildTime(num time) {
    return Row(
      children: [
        const Icon(Icons.timer_rounded, size: 30),
        width(5),
        Text(
          time.toTimeHourMinuteSecond,
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
