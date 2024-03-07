import 'package:equatable/equatable.dart';

// abstract class  Failure extends  Equatable{
//   Failure([List props=const<dynamic>[]]) : supper[props];

// }
abstract class Failure extends Equatable {
  Failure([List properties = const <dynamic>[]]);
}

// General failures
class ServerFailure extends Failure {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LocalFailure extends Failure {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class InvalidInputFailure extends Failure {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
