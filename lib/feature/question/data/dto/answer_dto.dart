part of 'create_question.dto.dart';

class AnswerDto extends FormDTO {
  final TextEditingController answerController;
  final EditingController<bool> isCorrectController;
  final ListEditingController<ImageDTO> imagesController;

  AnswerDto([Answer? answer])
      : answerController = TextEditingController(text: answer?.text),
        isCorrectController =
            EditingController<bool>(answer?.isCorrect ?? false),
        imagesController = ListEditingController<ImageDTO>(
          answer?.images
                  ?.map((e) => RemoteImageDTO(url: e))
                  .toList() ??
              [],
        );

  @override
  void dispose() {
    answerController.dispose();
    isCorrectController.dispose();
    imagesController.dispose();
  }

  @override
  Future<Map<String, dynamic>> toMap() async {
    return {
      'text': answerController.text,
      'isCorrect': isCorrectController.value,
      'images': await imagesController.value.imageUrls,
    }.withoutNullsOrEmpty();
  }

  AnswerDto getCopy() {
    return AnswerDto()
      ..answerController.text = answerController.text
      ..isCorrectController.value = isCorrectController.value
      ..imagesController.value = imagesController.value;
  }

  void replace(AnswerDto dto) {
    answerController.text = dto.answerController.text;
    isCorrectController.value = dto.isCorrectController.value;
    imagesController.value = dto.imagesController.value;
  }
}
