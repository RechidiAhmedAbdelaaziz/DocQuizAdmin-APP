abstract class UserApiConstants {
  static const _baseUrl = 'https://api.docquizz.top';
  // static const _baseUrl = 'http://192.168.1.2:3000';

  //*AUTH
  static const login = '$_baseUrl/auth/login-admin';
  static const refreshToken = '$_baseUrl/auth/refresh-token';

  //*EXAM
  static const getExams = '$_baseUrl/exam';
  static const getExam = '$_baseUrl/exam/{id}';

  //*QUESTION
  static const question = '$_baseUrl/question';

  //* Statistics
  static const statistics = '$_baseUrl/statistic';

  //* Domain
  static const domains = '$_baseUrl/domains';

  //* LEVEL
  static const levels = '$_baseUrl/levels';

  //* MAJOR
  static const majors = '$_baseUrl/majors';

  //* COURSE
  static const courses = '$_baseUrl/courses';

  //* SOURCE
  static const sources = '$_baseUrl/source';

  //* UPDATES
  static const updates = '$_baseUrl/updates';

  // * ADMIN
  static const admins = '$_baseUrl/admins';
  static const admin = '$_baseUrl/admins/{id}';

}
