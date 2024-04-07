import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure([this.message]);

  final String? message;

  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure(String super.message);
}

class LocalFailure extends Failure {
  const LocalFailure(String super.message);
}

class NoDataFailure extends Failure {
  const NoDataFailure(String super.message);
}

class InvalidInputFailure extends Failure {
  const InvalidInputFailure(String super.message);
}
