part of '../question_screen.dart';

class _AnswerForm extends StatelessWidget {
  final AnswerDto _dto;
  const _AnswerForm(this._dto);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Form(
        key: _dto.formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
                      _dto.validate() ? context.back(_dto) : null,
                ),
              ],
            ),
            height(16),
            AppTextField(
              controller: _dto.answerController,
              label: 'Réponse',
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
            ValueListenableBuilder(
              valueListenable: _dto.isCorrectController,
              builder: (_, isCorrect, __) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Réponse correcte',
                      style: AppTextStyles.medium,
                    ),
                    Switch(
                      value: isCorrect ?? false,
                      activeColor: Colors.green,
                      inactiveThumbColor: AppColors.red,
                      inactiveTrackColor: AppColors.red.withAlpha(50),
                      onChanged: (value) {
                        _dto.isCorrectController.value = value;
                      },
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
