abstract class AdminApiConstants {
  static const _baseUrl = 'https://admin.api.docquizz.top';

  //*LEVEL
  static const createLevel = '$_baseUrl/levels';
  static const addMajor = '$_baseUrl/levels/major';
  static const addCourse = '$_baseUrl/levels/course';

  //*EXAM
  static const exam = '$_baseUrl/exam-admin';
  static const examWithID = '$_baseUrl/exam-admin/{id}';

  //* Question
  static const question = '$_baseUrl/question';
  static const questionWithId = '$_baseUrl/question/{id}';


}
