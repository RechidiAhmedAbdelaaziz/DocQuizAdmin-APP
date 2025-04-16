part of '../question_screen.dart';

class _CastTextField extends StatelessWidget {
  const _CastTextField();

  @override
  Widget build(BuildContext context) {
    final dto = context.read<QuestionCubit>().dto;

    return Column(
      children: [
        AppTextField(
          controller: dto.caseTextController,
          label: 'Cas clinic',
          isRequired: true,
          keyboardType: TextInputType.multiline,
          validator: (value) {
            final isRequired =
                dto.subQuestionsController.value.length > 1;
            return (isRequired && (value?.isEmpty ?? false))
                ? 'Ce champ est requis'
                : (!isRequired && (value?.isNotEmpty ?? false))
                    ? 'Ce champ doit être vide'
                    : null;
          },
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
  }
}
