abstract class AdminApiConstants {
  static const _baseUrl = 'http://192.168.1.12:3001';

  //*LEVEL
  static const createLevel = '$_baseUrl/levels';
  static const addMajor = '$_baseUrl/levels/major';
  static const addCourse = '$_baseUrl/levels/course';

  //*EXAM
  static const createExam = '$_baseUrl/exam-admin';
  static const updateExam = '$_baseUrl/exam-admin/{id}';
}
