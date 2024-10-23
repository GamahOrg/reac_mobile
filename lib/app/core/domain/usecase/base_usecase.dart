import 'package:dartz/dartz.dart';

import '../../data/network/error_handler.dart';

abstract class BaseUseCase<Out> {
  Future<Either<Failure, Out>> execute();
}

