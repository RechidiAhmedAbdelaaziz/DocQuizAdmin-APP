part of 'create_question.dto.dart';

class SourceDTO extends FormDTO {
  final EditingController<SourceModel> sourceController;
  final EditingController<String> yearController;

  SourceDTO([SourceYear? source])
      : sourceController =
            EditingController<SourceModel>(source?.source),
        yearController =
            EditingController<String>(source?.year.toString());

  @override
  Future<Map<String, dynamic>> toMap() async {
    return {
      'sourceId': sourceController.value?.id,
      'year': int.tryParse(yearController.value ?? ''),
    }.withoutNullsOrEmpty();
  }

  @override
  void dispose() {
    sourceController.dispose();
    yearController.dispose();
  }
}
