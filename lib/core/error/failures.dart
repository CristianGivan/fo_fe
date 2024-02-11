import 'package:equatable/equatable.dart';

// abstract class  Failure extends  Equatable{
//   Failure([List props=const<dynamic>[]]) : supper[props];

// }
abstract class Failure extends Equatable {}

// General failures
class ServerFailure extends Failure {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CacheFailure extends Failure {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
