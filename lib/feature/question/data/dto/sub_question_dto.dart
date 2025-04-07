part of 'create_question.dto.dart';

class SubQuestionDTO extends FormDTO {
  final TextEditingController questionController;
  final ListEditingController<AnswerDto> answersController;
  final EditingController<ExplanationDto> explanationController;
  final EditingController<String> difficultyController;
  final ListEditingController<ImageDTO> imagesController;

  SubQuestionDTO([Question? question])
      : questionController =
            TextEditingController(text: question?.text),
        answersController = ListEditingController<AnswerDto>(
          question?.answers?.map((e) => AnswerDto(e)).toList() ?? [],
        ),
        explanationController = EditingController<ExplanationDto>(
          ExplanationDto(question?.explanation),
        ),
        difficultyController =
            EditingController<String>(question?.difficulty ?? 'easy'),
        imagesController = ListEditingController<ImageDTO>(
          question?.images
                  ?.map((e) => RemoteImageDTO(url: e))
                  .toList() ??
              [],
        );

  @override
  void dispose() {
    questionController.dispose();
    answersController.dispose();
    explanationController.dispose();
    difficultyController.dispose();
    imagesController.dispose();
  }

  @override
  Future<Map<String, dynamic>> toMap() async {
    return {
      'text': questionController.text,
      'answers': await Future.wait(
        answersController.value.map((e) => e.toMap()).toList(),
      ),
      'explanation': await explanationController.value?.toMap(),
      'difficulty': difficultyController.value,
      'images': await imagesController.value.imageUrls,
    }.withoutNullsOrEmpty();
  }

  SubQuestionDTO getCopy() {
    return SubQuestionDTO()
      ..questionController.text = questionController.text
      ..answersController.value = answersController.value
      ..explanationController.value = explanationController.value
      ..difficultyController.value = difficultyController.value
      ..imagesController.value = imagesController.value;
  }

  void replace(SubQuestionDTO dto) {
    questionController.text = dto.questionController.text;
    answersController.value = dto.answersController.value;
    explanationController.value = dto.explanationController.value;
    difficultyController.value = dto.difficultyController.value;
    imagesController.value = dto.imagesController.value;
  }
}
