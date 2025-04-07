import 'package:admin_app/core/extension/map.extension.dart';
import 'package:admin_app/core/shared/classes/editioncontollers/generic_editingcontroller.dart';
import 'package:admin_app/core/shared/classes/editioncontollers/list_generic_editingcontroller.dart';
import 'package:admin_app/core/shared/dto/form_dto.dart';
import 'package:admin_app/core/shared/dto/imagedto/image.dto.dart';
import 'package:admin_app/feature/course/data/models/course.model.dart';
import 'package:admin_app/feature/exam/data/models/exam.model.dart';
import 'package:admin_app/feature/question/data/models/question.model.dart';
import 'package:admin_app/feature/source/data/model/source.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

part 'sub_question_dto.dart';
part 'source_dto.dart';
part 'answer_dto.dart';
part 'explanation_dto.dart';

class QuestionDTO extends FormDTO {
  final TextEditingController caseTextController;
  final ListEditingController<SubQuestionDTO> subQuestionsController;
  final EditingController<CourseModel> courseController;
  final ListEditingController<SourceDTO> sourcesController;
  final ListEditingController<ExamModel> examsController;
  final ListEditingController<ImageDTO> imagesController;

  QuestionDTO([QuestionModel? question])
      : caseTextController =
            TextEditingController(text: question?.caseText),
        subQuestionsController =
            ListEditingController<SubQuestionDTO>(
          question?.questions
                  ?.map((e) => SubQuestionDTO(e))
                  .toList() ??
              [],
        ),
        courseController =
            EditingController<CourseModel>(question?.course),
        sourcesController = ListEditingController<SourceDTO>(
          question?.sources.map((e) => SourceDTO(e)).toList() ?? [],
        ),
        examsController = ListEditingController<ExamModel>(
          question?.exams ?? [],
        ),
        imagesController = ListEditingController<ImageDTO>(
          question?.images
                  ?.map((e) => RemoteImageDTO(url: e))
                  .toList() ??
              [],
        );

  @override
  void dispose() {
    caseTextController.dispose();
    subQuestionsController.dispose();
    courseController.dispose();
    sourcesController.dispose();
    examsController.dispose();
  }

  @override
  Future<Map<String, dynamic>> toMap() async {
    return {
      'caseText': caseTextController.text,
      'questions': await Future.wait(
        subQuestionsController.value.map((e) => e.toMap()).toList(),
      ),
      'courseId': courseController.value?.id,
      'sources': await Future.wait(
        sourcesController.value.map((e) => e.toMap()).toList(),
      ),
      'examIds': examsController.value.map((e) => e.id).toList(),
      'images': await imagesController.value.imageUrls,
    }.withoutNullsOrEmpty();
  }

  void addQuestion() =>
      subQuestionsController.addValue(SubQuestionDTO());
}
