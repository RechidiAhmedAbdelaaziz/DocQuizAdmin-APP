part of '../question_screen.dart';

class _QuestionsField extends StatelessWidget {
  const _QuestionsField();

  @override
  Widget build(BuildContext context) {
    final questionsController =
        context.read<QuestionCubit>().dto.subQuestionsController;
    return MultiModelSelector(
      controller: questionsController,
      title: 'Questions',
      isRequired: true,
      itemsBuilder: (_, questions) {
        return Wrap(
          spacing: 8.w,
          runSpacing: 8.h,
          children: [
            for (var question in questions)
              ValueListenableBuilder(
                  valueListenable: question.questionController,
                  builder: (_, questionText, __) {
                    return Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(color: AppColors.grey),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              questionText.text,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyles.medium,
                            ),
                          ),
                          IconButton(
                            onPressed: () =>
                                context.dialogWith<SubQuestionDTO>(
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 12.h,
                                  horizontal: 16.w,
                                ),
                                margin: EdgeInsets.symmetric(
                                  vertical: 32.h,
                                  horizontal: 20.w,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius:
                                      BorderRadius.circular(12.r),
                                  border: Border.all(
                                      color: AppColors.grey),
                                ),
                                child:
                                    _QuestionForm(question.getCopy()),
                              ),
                              onResult: question.replace,
                            ),
                            icon: const Icon(Icons.edit),
                          ),
                          IconButton(
                            onPressed: () => questionsController
                                .removeValue(question),
                            icon: const Icon(
                              Icons.close,
                              color: AppColors.red,
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
          ],
        );
      },
      selector: () => _QuestionForm(SubQuestionDTO()),
    );
  }
}
