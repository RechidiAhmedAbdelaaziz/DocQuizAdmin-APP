abstract class UserApiConstants {
  static const _baseUrl = 'http://192.168.1.12:3000';

  //*AUTH
  static const login = '$_baseUrl/auth/login';
  static const refreshToken = '$_baseUrl/auth/refresh-token';

  //*LEVEL
  static const getLevels = '$_baseUrl/levels';
  static const getMajors = '$_baseUrl/levels/majors';
  static const getCourses = '$_baseUrl/levels/courses';
}
