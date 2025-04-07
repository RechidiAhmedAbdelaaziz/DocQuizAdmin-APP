import 'package:admin_app/core/extension/alertdialog.extenstion.dart';
import 'package:admin_app/core/extension/navigator.extension.dart';
import 'package:admin_app/core/extension/snackbar.extension.dart';
import 'package:admin_app/core/shared/classes/editioncontollers/list_generic_editingcontroller.dart';
import 'package:admin_app/core/shared/widget/button.dart';
import 'package:admin_app/core/shared/widget/images_field.dart';
import 'package:admin_app/core/shared/widget/model_selector.dart';
import 'package:admin_app/core/shared/widget/multi_model_selector.dart';
import 'package:admin_app/core/shared/widget/space.widget.dart';
import 'package:admin_app/core/shared/widget/text_field.dart';
import 'package:admin_app/core/themes/colors.dart';
import 'package:admin_app/core/themes/dimensions.dart';
import 'package:admin_app/core/themes/font_styles.dart';
import 'package:admin_app/feature/course/data/models/course.model.dart';
import 'package:admin_app/feature/domain/ui/domain_selector.dart';
import 'package:admin_app/feature/exam/data/models/exam.model.dart';
import 'package:admin_app/feature/exam/view/exam_selector.dart';
import 'package:admin_app/feature/question/data/dto/create_question.dto.dart';
import 'package:admin_app/feature/question/data/models/question.model.dart';
import 'package:admin_app/feature/question/module/question/logic/question.cubit.dart';
import 'package:admin_app/feature/source/ui/source_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part 'widget/case_text_field.dart';
part 'widget/questions_field.dart';
part 'widget/question_form.dart';
part 'widget/answer_form.dart';
part 'widget/answers_field.dart';
part 'widget/source_field.dart';

class QuestionScreen extends StatelessWidget {
  const QuestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dto = context.read<QuestionCubit>().dto;
    return BlocListener<QuestionCubit, QuestionState>(
      listener: (context, state) {
        state.onSaved((question) {
          context.showSuccessSnackBar(
              "Question sauvegardée avec succès");
          context.back(question);
        });
        state.onError(context.showErrorSnackBar);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            context.read<QuestionCubit>().isEditing
                ? 'Modifier la question'
                : 'Créer une question',
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 16.w, vertical: 16.h),
            child: Form(
              key: dto.formKey,
              child: Column(
                children: [
                  _CastTextField(),
                  height(24),
                  _QuestionsField(),
                  heightSpace(24),
                  ModelSelector(
                    controller: dto.courseController,
                    title: 'Cours',
                    itemBuilder: (_, course) => Text(
                      course.name ?? "",
                      style: AppTextStyles.medium,
                    ),
                    selector: DomainSelector<CourseModel>(),
                    isRequired: true,
                  ),
                  heightSpace(24),
                  _SourceField(),
                  heightSpace(24),
                  MultiModelSelector(
                    controller: dto.examsController,
                    title: 'Examens',
                    itemsBuilder: (_, exams) =>
                        _buildExams(exams, dto),
                    selector: () => ExamSelector(),
                  ),
                  heightSpace(24),
                  AppButton.primary(
                    text: "Sauvegarder",
                    onPressed: () =>
                        context.read<QuestionCubit>().save(),
                    isLoading: (ctx) => ctx.select(
                      (QuestionCubit cubit) => cubit.state.isLoading,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Wrap _buildExams(List<ExamModel> exams, QuestionDTO dto) {
    return Wrap(
      spacing: 8.w,
      runSpacing: 8.h,
      children: [
        for (var exam in exams)
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 8.w,
              vertical: 8.h,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8).r,
              border: Border.all(color: AppColors.grey),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    exam.title ?? "",
                    style: AppTextStyles.medium,
                  ),
                ),
                IconButton(
                  onPressed: () =>
                      dto.examsController.removeValue(exam),
                  icon: const Icon(
                    Icons.delete,
                    color: AppColors.red,
                  ),
                ),
              ],
            ),
          )
      ],
    );
  }
}
