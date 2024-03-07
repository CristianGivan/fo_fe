import 'package:dartz/dartz.dart';

import '../error/failures.dart';

class InputConverter {
  Either<Failure, int> stringToUnasingInteger(String input) {
    try {
      int convertedNumber;

      convertedNumber = int.parse(input);
      if (convertedNumber > 0) {
        return Right(convertedNumber);
      } else {
        return Left(InvalidInputFailure());
      }
    } on FormatException {
      return Left(InvalidInputFailure());
    }
  }
}
