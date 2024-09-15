part of 'exam.screen.dart';

class _ExamList extends StatelessWidget {
  const _ExamList();

  @override
  Widget build(BuildContext context) {
    final exams = context.watch<ExamCubit>().exams;
    final cubit = context.read<ExamCubit>();
    return Column(
      children: [
        height(20),
        ...exams.map((exam) => _ExamItem(
              exam,
              onDelete: (exam) => cubit.deleteExam(exam),
              onEdit: (exam) async {
                final updatedExam = await context
                    .to<CreateExamParam>(CreateExamRoute(exam: exam));
                if (updatedExam != null) {
                  cubit.updateExam(
                    exam,
                    major: updatedExam.major,
                    time: updatedExam.time.toInt(),
                    year: updatedExam.year.toInt(),
                    city: updatedExam.city,
                  );
                }
              },
            )),
      ],
    );
  }
}

class _ExamItem extends StatelessWidget {
  const _ExamItem(this._exam,
      {required void Function(ExamModel) onEdit,
      required void Function(ExamModel) onDelete})
      : _onEdit = onEdit,
        _onDelete = onDelete;

  final ExamModel _exam;
  final void Function(ExamModel) _onEdit;
  final void Function(ExamModel) _onDelete;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.to(QuestionListRoute.ofExam(_exam)),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 16.w),
        padding:
            EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
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
            Expanded(
              child: Column(
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
            ),
            _buildEditButton(
              onPressed: () => _onEdit(_exam),
            ),
            _buildDeleteButton(
              onPressed: () => _onDelete(_exam),
            ),
          ],
        ),
      ),
    );
  }

  IconButton _buildDeleteButton({
    required void Function() onPressed,
  }) {
    return IconButton(
      onPressed: onPressed,
      icon: const Icon(Icons.delete_rounded),
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
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Text _buildTitle(String title) {
    return Text(
      title,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  IconButton _buildEditButton({
    required void Function() onPressed,
  }) {
    return IconButton(
      onPressed: onPressed,
      icon: const Icon(Icons.edit_rounded),
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
