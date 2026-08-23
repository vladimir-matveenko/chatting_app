class AppEnv {
  static String get baseUrl => const String.fromEnvironment(
    'BASE_URL',
    // defaultValue: 'https://chatting-app-api-y1cp.onrender.com/',
    // defaultValue: 'http://127.0.0.1:3000/',
  );
}
