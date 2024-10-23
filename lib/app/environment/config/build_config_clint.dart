import 'package:injectable/injectable.dart';

import 'build_config.dart';

@Injectable(as: BuildConfig, env: [CustomEnv.client])
class BuildConfigClient extends BuildConfig {
  @override
  String get env => CustomEnv.client;

  @override
  String get baseUrl => 'https://systemapi.ncw.gov.sa/api/';
}
