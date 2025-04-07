part of 'create_question.dto.dart';

class ExplanationDto extends FormDTO {
  final TextEditingController explanationController;
  final ListEditingController<ImageDTO> imagesController;

  ExplanationDto([Explanation? explanation])
      : explanationController =
            TextEditingController(text: explanation?.text),
        imagesController = ListEditingController<ImageDTO>(
          explanation?.images
                  ?.map((e) => RemoteImageDTO(url: e))
                  .toList() ??
              [],
        );

  @override
  void dispose() {
    explanationController.dispose();
    imagesController.dispose();
  }

  @override
  Future<Map<String, dynamic>> toMap() async {
    return {
      'text': explanationController.text,
      'images': await imagesController.value.imageUrls,
    }.withoutNullsOrEmpty();
  }
}
