import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/const/failures_message.dart';

import '../error/failures.dart';

class InputConverter {
  Either<Failure, int> stringToUnasingInteger(String input) {
    try {
      int convertedNumber;

      convertedNumber = int.parse(input);
      if (convertedNumber > 0) {
        return Right(convertedNumber);
      } else {
        return const Left(InvalidInputFailure(zeroOrNegativeNumber));
      }
    } on FormatException {
      return const Left(InvalidInputFailure(notNumber));
    }
  }
}
