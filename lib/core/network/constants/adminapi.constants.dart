abstract class AdminApiConstants {
  static const _baseUrl = 'https://admin.api.docquizz.top';
  // static const _baseUrl = 'http://192.168.6.172:3001';

  //*EXAM
  static const exam = '$_baseUrl/exam-admin';
  static const examWithID = '$_baseUrl/exam-admin/{id}';

  //* Question
  static const question = '$_baseUrl/question';
  static const questionWithId = '$_baseUrl/question/{id}';

  //* Domain
  static const domain = '$_baseUrl/domains';
  static const domainWithId = '$_baseUrl/domains/{id}';

  //* LEVEL
  static const levelWithDomainId = '$_baseUrl/levels/{domainId}';
  static const levelWithId = '$_baseUrl/levels/{id}';

  //* MAJOR
  static const majorWithLevelId = '$_baseUrl/majors/{levelId}';
  static const majorWithId = '$_baseUrl/majors/{id}';

  //* COURSE
  static const courseWithMajorId = '$_baseUrl/courses/{majorId}';
  static const courseWithId = '$_baseUrl/courses/{id}';

  //* SOURCE
  static const source = '$_baseUrl/source';
  static const sourceWithId = '$_baseUrl/source/{id}';

  //* UPDATES
  static const updates = '$_baseUrl/updates';
  static const updatesWithId = '$_baseUrl/updates/{id}';
}
