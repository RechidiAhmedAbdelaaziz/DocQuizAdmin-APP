part of '../question_screen.dart';

class _CastTextField extends StatelessWidget {
  const _CastTextField();

  @override
  Widget build(BuildContext context) {
    final dto = context.read<QuestionCubit>().dto;
    return ValueListenableBuilder(
      valueListenable: dto.subQuestionsController,
      builder: (_, questions, __) {
        if (questions!.length < 2) return SizedBox.shrink();
        return Column(
          children: [
            AppTextField(
              controller: dto.caseTextController,
              label: 'Cas clinic',
              isRequired: true,
              keyboardType: TextInputType.multiline,
              validator: (value) => value?.isEmpty ?? false
                  ? 'Ce champ est requis'
                  : null,
            ),
            height(8),
            ImagesField(
              controller: dto.imagesController,
              height: 280.h,
              borderRadius: 12.r,
            ),
            const Divider(),
          ],
        );
      },
    );
  }
}
