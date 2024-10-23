abstract class CustomEnv {
  static const String client = 'client';
}

abstract class BuildConfig {
  String get env;
  String get baseUrl;

}
