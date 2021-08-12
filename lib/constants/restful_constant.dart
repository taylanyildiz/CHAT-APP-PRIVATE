class RestfulConstant {
  RestfulConstant._();

  static const String LOCAL = 'http://localhost:';
  static const String HOST = 'http://213.238.180.11:';
  static const String PORT = '3050';
  static const String API_VERSION = '/api/v1';
  static const String BASE_URL = HOST + PORT + API_VERSION;
  static const String BASE_LOCAL_URL = HOST + PORT + API_VERSION;
  static const String CREATE_ACCOUNT = '/user/create-account';
  static const String LOGIN = '/user/login';
  static const String REFRESH_TOKEN = '/take/new-token';
  static const String CHECK_ACCOUNT = '/user/check-connection';
}
