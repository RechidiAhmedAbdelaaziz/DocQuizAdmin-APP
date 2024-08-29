part of 'questions_list.screen.dart';

class _QuestionList extends StatelessWidget {
  const _QuestionList();

  @override
  Widget build(BuildContext context) {
    final questions = context.watch<QuestionListCubit>().questions;
    return Column(
      children:
          questions.map((question) => _Question(question)).toList(),
    );
  }
}

class _Question extends StatelessWidget {
  final QuestionModel _question;

  const _Question(
    this._question,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildMajor(),
              _buildSource(),
            ],
          ),
          height(8),
          _buildTitle(
            onEdit: () {
              context.to(
                UpdateQuestionRoute(_question,
                    questionListCubit:
                        context.read<QuestionListCubit>()),
              );
            },
          ),
          height(8),
          Row(
            children: [
              _buildType(),
              width(8),
              _buildDifficulty(),
              width(8),
              _buildIsExplanated(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTitle({
    required VoidCallback onEdit,
  }) {
    return Row(
      children: [
        Expanded(
          child: Text(
            _question.questionText!,
            maxLines: 3,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.edit),
          onPressed: onEdit,
        ),
      ],
    );
  }

  Widget _buildSource() {
    return _buildProperty(
      _question.source?.title,
      color: Colors.green,
    );
  }

  Widget _buildMajor() {
    return _buildProperty(
      _question.field?.major,
      color: Colors.blue,
    );
  }

  Widget _buildIsExplanated() {
    return _buildProperty(
      _question.explanation != null ? 'With Explanation' : null,
      color: Colors.purple,
    );
  }

  Widget _buildDifficulty() {
    final difficulty = _question.difficulty!.toUpperCase();
    return _buildProperty(
      difficulty,
      color: difficulty == 'EASY'
          ? Colors.green
          : difficulty == 'MEDIUM'
              ? Colors.orange
              : Colors.red,
    );
  }

  Widget _buildType() {
    final type = _question.type!.toUpperCase(); // QCM or QCU
    return _buildProperty(
      type,
      color: type == 'QCM' ? Colors.deepOrange : Colors.blue,
    );
  }

  Widget _buildProperty(
    String? value, {
    Color color = Colors.black,
  }) {
    return value != null
        ? Container(
            padding:
                EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Text(
              value,
              style: TextStyle(
                color: color,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        : const SizedBox.shrink();
  }
}
