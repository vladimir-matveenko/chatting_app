class AppEnv {
  static String get baseUrl =>
      const String.fromEnvironment('BASE_URL', defaultValue: '');
}
