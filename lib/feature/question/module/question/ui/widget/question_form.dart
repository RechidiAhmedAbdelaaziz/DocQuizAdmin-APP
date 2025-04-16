part of '../question_screen.dart';

class _QuestionForm extends StatelessWidget {
  final SubQuestionDTO _dto;
  const _QuestionForm(this._dto);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Form(
        key: _dto.formKey,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () => context.back(),
                  icon: const Icon(Icons.close),
                ),
                AppButton.primary(
                  text: 'Sauvegarder',
                  onPressed: () =>
                      _dto.formKey.currentState?.validate() == true
                          ? context.back(_dto)
                          : null,
                ),
              ],
            ),
            height(16),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppTextField(
                      controller: _dto.questionController,
                      label: 'Question',
                      keyboardType: TextInputType.multiline,
                      isRequired: true,
                      validator: (validator) {
                        if (validator == null || validator.isEmpty) {
                          return 'Ce champ est requis';
                        }
                        return null;
                      },
                    ),
                    height(8),
                    ImagesField(
                      controller: _dto.imagesController,
                      height: 280.h,
                      borderRadius: 12.r,
                    ),
                    const Divider(),
                    height(24),
                    _AnswersField(_dto.answersController),
                    height(24),
                    ValueListenableBuilder(
                      valueListenable: _dto.difficultyController,
                      builder: (_, difficulty, __) {
                        return Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                            children: [
                              ...{
                                "easy": Colors.green,
                                "medium": Colors.orange,
                                "hard": Colors.red,
                              }.entries.map((e) {
                                final color = e.value;
                                final isSelected =
                                    e.key == difficulty;
                                return InkWell(
                                  onTap: () => _dto
                                      .difficultyController
                                      .value = e.key,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 12.w,
                                      vertical: 4.h,
                                    ),
                                    decoration: BoxDecoration(
                                      color: isSelected
                                          ? color
                                          : AppColors.white,
                                      borderRadius:
                                          BorderRadius.circular(16.r),
                                      border:
                                          Border.all(color: color),
                                    ),
                                    child: Text(
                                      e.key.toUpperCase(),
                                      style: AppTextStyles.large
                                          .copyWith(
                                        color: isSelected
                                            ? Colors.white
                                            : color,
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ]);
                      },
                    ),
                    height(24),
                    AppTextField(
                      controller: _dto.explanationController.value!
                          .explanationController,
                      label: 'Explication',
                      keyboardType: TextInputType.multiline,
                    ),
                    height(8),
                    ImagesField(
                      controller: _dto.explanationController.value!
                          .imagesController,
                      height: 280.h,
                      borderRadius: 12.r,
                    ),
                    height(24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
