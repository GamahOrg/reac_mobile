import 'package:dartz/dartz.dart';

import 'package:injectable/injectable.dart';

import '../../../function.dart';
import 'error_handler.dart';
import 'network_info.dart';


@injectable
class SafeApi {
  final NetworkInfo _networkInfo;

  SafeApi(this._networkInfo);

  Future<Either<Failure, T>> call<T, M>(
      {required Future<T> apiCall}) async {
    // if (await _networkInfo.isConnected) {
      try {
        final response = await apiCall;
          return Right(response);
      } catch (error, stacktrace) {
        dPrint("SafeApi Error: $error");
        dPrint("$stacktrace");
        return Left(ErrorHandler.handle(error).failure);
      }
    // } else {
    //   return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    // }
  }
}
