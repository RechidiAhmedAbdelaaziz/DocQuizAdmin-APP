part of '../question_screen.dart';

class _AnswersField extends StatelessWidget {
  final ListEditingController<AnswerDto> _dtos;
  const _AnswersField(this._dtos);

  @override
  Widget build(BuildContext context) {
    return MultiModelSelector(
      controller: _dtos,
      title: 'Answers',
      isRequired: true,
      itemsBuilder: (_, dtos) {
        return Wrap(
          spacing: 8.w,
          runSpacing: 8.h,
          children: [
            for (var dto in dtos)
              ValueListenableBuilder(
                valueListenable: dto.answerController,
                builder: (_, answerText, __) {
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
                            answerText.text,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.medium,
                          ),
                        ),
                        IconButton(
                          onPressed: () =>
                              context.dialogWith<AnswerDto>(
                            onResult: dto.replace,
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
                                border:
                                    Border.all(color: AppColors.grey),
                              ),
                              child: _AnswerForm(dto.getCopy()),
                            ),
                          ),
                          iconSize: 24.sp,
                          icon: const Icon(
                            Icons.edit,
                            color: AppColors.grey,
                          ),
                        ),
                        IconButton(
                          onPressed: () => _dtos.removeValue(dto),
                          icon: Icon(
                            Icons.delete,
                            color: AppColors.red,
                          ),
                          iconSize: 24.sp,
                        ),
                      ],
                    ),
                  );
                },
              )
          ],
        );
      },
      selector: () => _AnswerForm(AnswerDto()),
    );
  }
}
