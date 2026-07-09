class AppEnv {
  static String get baseUrl => const String.fromEnvironment(
    'BASE_URL',
    defaultValue: 'http://127.0.0.1:3000/',
  );
}
