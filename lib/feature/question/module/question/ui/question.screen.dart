import 'package:admin_app/core/extension/alertdialog.extenstion.dart';
import 'package:admin_app/core/extension/bottomsheet.extension.dart';
import 'package:admin_app/core/extension/dropdown.extension.dart';
import 'package:admin_app/core/extension/navigator.extension.dart';
import 'package:admin_app/core/extension/validator.extension.dart';
import 'package:admin_app/core/shared/widget/dynamic_pageview.dart';
import 'package:admin_app/core/shared/widget/inpute_field.widget.dart';
import 'package:admin_app/core/shared/widget/space.widget.dart';
import 'package:admin_app/feature/course/data/models/course.model.dart';
import 'package:admin_app/feature/domain/ui/domain_selector.dart';
import 'package:admin_app/feature/exam/data/models/exam.model.dart';
import 'package:admin_app/feature/exam/view/exam_selector.dart';
import 'package:admin_app/feature/question/data/dto/create_question.dto.dart';
import 'package:admin_app/feature/question/module/question/logic/question.cubit.dart';
import 'package:admin_app/feature/source/data/model/source.model.dart';
import 'package:admin_app/feature/source/ui/source_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuestionScreen extends StatelessWidget {
  const QuestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isLoading =
        context.select((QuestionCubit cubit) => cubit.state.isSaving);

    final question = context.watch<QuestionCubit>().state.details;

    return BlocListener<QuestionCubit, QuestionState>(
      listener: (context, state) {
        state.onError((error) {
          context.showDialogBox(
            title: 'Error',
            body: error,
            cancelText: 'Retour',
            onCancel: (back) => back(),
          );
        });

        state.onSaved((question) => context.back(question));
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Question'),
        ),
        body: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          child: isLoading
              ? const Center(child: CircularProgressIndicator())
              : Form(
                  key: context.read<QuestionCubit>().formKey,
                  child: ListView(
                    children: [
                      if (question.questions.length > 1) ...[
                        _buildTitle('Le cas clinique'),
                        const _CaseCliniqueField(),
                        const Divider(),
                      ],
                      _buildTitle(
                          '${question.questions.length > 1 ? 'Les questions' : 'Le question'} '),
                      const _QuestionsBox(),
                      const Divider(),
                      _buildTitle('Cours'),
                      const _CourseField(),
                      const Divider(),
                      _buildTitle('Source'),
                      const _SourceField(),
                      const Divider(),
                      _buildTitle('Examen'),
                      const _ExamField(),
                      const Divider(),
                      _buildTitle('Année'),
                      const _YearField(),
                      const Divider(),
                      const _SubmitButton(),
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  Widget _buildTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 22.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _CaseCliniqueField extends StatelessWidget {
  const _CaseCliniqueField();

  @override
  Widget build(BuildContext context) {
    final controller =
        context.watch<QuestionCubit>().state.details.caseText;
    return AppInputeField(
      controller: controller,
      hint: 'Entrer le cas clinique',
      keyboardType: TextInputType.multiline,
    );
  }
}

class _QuestionsBox extends StatelessWidget {
  const _QuestionsBox();

  @override
  Widget build(BuildContext context) {
    final questions =
        context.watch<QuestionCubit>().state.details.questions;

   
    return Column(
      children: [
        _buildAddQuestionButton(
            () => context.read<QuestionCubit>().addQuestion()),
        const Divider(),
        DynamicPageView(
          children: [
            for (int i = 0; i < questions.length; i++)
              _buildQuestion(i, questions, context)
          ],
        ),
        // PageView.builder(
        //   controller: PageController(),
        //   itemCount: questions.length,
        //   itemBuilder: (context, index) {
        //     return _buildQuestion(index, questions, context);
        //   },
        // ),
      ],
    );
  }

  Container _buildQuestion(
      int index, List<SubQuestion> questions, BuildContext context) {
    final question = questions[index];
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      margin: EdgeInsets.only(right: 4.w),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.teal),
        borderRadius: BorderRadius.circular(12),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                width(12),
                _buildIndicator(index),
                const Spacer(),
                if (questions.length > 1)
                  IconButton(
                    onPressed: () {
                      context
                          .read<QuestionCubit>()
                          .removeQuestion(question);
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  )
              ],
            ),
            _QuestionField(question),
            _buildTitle('Les réponses'),
            _AnswersField(question),
            const Divider(),
            _buildTitle('Explication'),
            _ExplanationField(question),
            const Divider(),
            _buildTitle('Difficulté'),
            _DifficultyField(question),
            height(12),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 22.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildAddQuestionButton(Function() onPressed) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          padding:
              EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(20.r),
          ),
          alignment: Alignment.center,
          child: Text(
            'Ajouter une question',
            style: TextStyle(
              fontSize: 18.sp,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIndicator(
    int index,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin:
              EdgeInsets.symmetric(horizontal: 4.w, vertical: 5.h),
          padding:
              EdgeInsets.symmetric(horizontal: 7.w, vertical: 7.h),
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: Colors.blue),
          child: Text(
            'Q${index + 1}',
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

class _QuestionField extends StatelessWidget {
  const _QuestionField(this.question);

  final SubQuestion question;

  @override
  Widget build(BuildContext context) {
    final controller = question.question;

    return AppInputeField(
      controller: controller,
      hint: 'Entrer le question',
      keyboardType: TextInputType.multiline,
      validator: (value) => value.isValidString,
    );
  }
}

class _AnswersField extends StatelessWidget {
  const _AnswersField(this.question);

  final SubQuestion question;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<QuestionCubit>();
    final answers = question.answers;
    return Column(
      children: [
        ...answers.map((answer) => Padding(
              padding: EdgeInsets.symmetric(vertical: 4.h),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () =>
                        cubit.updateAnswer(question, answer),
                    icon: Icon(
                      answer.isCorrect
                          ? Icons.check_circle
                          : Icons.cancel,
                      color: answer.isCorrect
                          ? Colors.green
                          : Colors.red,
                    ),
                  ),
                  Expanded(
                    child: AppInputeField(
                      controller: answer.controller,
                      hint: 'Entrer la réponse',
                      keyboardType: TextInputType.multiline,
                      validator: (value) => value.isValidString,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete_outline),
                    onPressed: () =>
                        cubit.removeAnswer(question, answer),
                  ),
                ],
              ),
            )),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            context.read<QuestionCubit>().addAnswer(question);
          },
        ),
      ],
    );
  }
}

class _CourseField extends StatelessWidget {
  const _CourseField();

  @override
  Widget build(BuildContext context) {
    final course =
        context.watch<QuestionCubit>().state.details.course;
    final cubit = context.read<QuestionCubit>();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Text(
            course?.name ?? 'Choisir un cours...',
            style: TextStyle(
              fontSize: 18.sp,
              color: course == null ? Colors.grey : Colors.black,
            ),
          ),
          const Spacer(),
          IconButton(
            icon: Icon(
              course == null ? Icons.add : Icons.edit,
              color: course != null ? Colors.grey : Colors.black,
            ),
            onPressed: () async {
              final course =
                  await context.showBottomSheet<CourseModel>(
                      child: const DomainSelector());

              if (course != null) cubit.updateCourse(course);
            },
          ),
        ],
      ),
    );
  }
}

class _ExplanationField extends StatelessWidget {
  const _ExplanationField(this.question);

  final SubQuestion question;

  @override
  Widget build(BuildContext context) {
    final controller = question.explanation;
    return AppInputeField(
      controller: controller,
      hint: 'Entrer l\'explication',
      keyboardType: TextInputType.multiline,
    );
  }
}

class _DifficultyField extends StatefulWidget {
  const _DifficultyField(this.question);

  final SubQuestion question;

  @override
  State<_DifficultyField> createState() => _DifficultyFieldState();
}

class _DifficultyFieldState extends State<_DifficultyField> {
  @override
  Widget build(BuildContext context) {
    final difficulty = widget.question.difficulty;

    void onChange(String value) {
      setState(() => difficulty.text = value);
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildDifficultyButton(
          title: 'Facile',
          isSelected: difficulty.text == 'easy',
          onPressed: () => onChange('easy'),
          color: Colors.green,
        ),
        _buildDifficultyButton(
          title: 'Moyen',
          isSelected: difficulty.text == 'medium',
          onPressed: () => onChange('medium'),
          color: Colors.orange,
        ),
        _buildDifficultyButton(
          title: 'Difficile',
          isSelected: difficulty.text == 'hard',
          onPressed: () => onChange('hard'),
          color: Colors.red,
        ),
      ],
    );
  }

  Widget _buildDifficultyButton({
    required String title,
    required bool isSelected,
    required Function() onPressed,
    required Color color,
  }) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        clipBehavior: Clip.antiAlias,
        padding:
            EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
        decoration: BoxDecoration(
          border: Border.all(color: color),
          borderRadius: BorderRadius.circular(20.r),
          color: isSelected ? color : Colors.white,
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight:
                isSelected ? FontWeight.bold : FontWeight.normal,
            color: isSelected ? Colors.white : color,
          ),
        ),
      ),
    );
  }
}

class _SourceField extends StatelessWidget {
  const _SourceField();

  @override
  Widget build(BuildContext context) {
    final source =
        context.watch<QuestionCubit>().state.details.source;
    final cubit = context.read<QuestionCubit>();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Text(
            source?.name ?? 'Choisir une source...',
            style: TextStyle(
              fontSize: 18.sp,
              color: source == null ? Colors.grey : Colors.black,
            ),
          ),
          const Spacer(),
          IconButton(
            icon: Icon(
              source == null ? Icons.add : Icons.edit,
              color: source != null ? Colors.grey : Colors.black,
            ),
            onPressed: () async {
              final source =
                  await context.showBottomSheet<SourceModel>(
                child: const SourceSelector(),
              );

              if (source != null) cubit.updateSource(source);
            },
          ),
        ],
      ),
    );
  }
}

class _YearField extends StatelessWidget {
  const _YearField();

  @override
  Widget build(BuildContext context) {
    final controller =
        context.watch<QuestionCubit>().state.details.year;
    return context.showSingleItemDropDown(
      controller: controller,
      data: [
        for (var i = 2000; i <= DateTime.now().year; i++)
          i.toString(),
      ],
    );
  }
}

class _ExamField extends StatelessWidget {
  const _ExamField();

  @override
  Widget build(BuildContext context) {
    final exam = context.watch<QuestionCubit>().state.details.exam;
    final cubit = context.read<QuestionCubit>();
    return Row(
      children: [
        Expanded(
          child: Container(
            padding:
                EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Row(
              children: [
                Text(
                  exam?.title ?? 'Choisir un examen...',
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: exam == null ? Colors.grey : Colors.black,
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: Icon(
                    exam == null ? Icons.add : Icons.edit,
                    color: exam != null ? Colors.grey : Colors.black,
                  ),
                  onPressed: () {
                    context
                        .showBottomSheet<ExamModel>(
                      child: const ExamSelector(),
                    )
                        .then((exam) {
                      if (exam != null) cubit.updateExam(exam);
                    });
                  },
                ),
              ],
            ),
          ),
        ),
        if (exam != null)
          IconButton(
            icon: const Icon(Icons.cancel),
            onPressed: () {
              cubit.removeExam();
            },
          ),
      ],
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<QuestionCubit>();
    return InkWell(
      onTap: cubit.save,
      child: Container(
        padding:
            EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        margin: EdgeInsets.symmetric(vertical: 12.h),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(20.r),
        ),
        alignment: Alignment.center,
        child: Text(
          'Enregistrer',
          style: TextStyle(
            fontSize: 18.sp,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
