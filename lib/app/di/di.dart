
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../environment/config/build_config.dart';
import 'di.config.dart';

final getIt = GetIt.instance;
@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
Future<void> configureDependencies() async => $initGetIt(getIt,
    environment:
    const String.fromEnvironment('env', defaultValue: CustomEnv.client));

