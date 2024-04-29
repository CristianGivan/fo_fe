import '../const/failures_message.dart';
import 'failures.dart';

String getFailureMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return serverFailureMessage;
    case NoDataFailure:
      return noDataFailure;
    default:
      return localFailureMessage;
  }
}
