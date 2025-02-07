import 'package:fpdart/fpdart.dart';

import '../error/failure.dart';

typedef Result<T> = Future<Either<Failure, T>>;
