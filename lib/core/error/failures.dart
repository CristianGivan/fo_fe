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

class UserNotFoundFailure extends Failure {
  const UserNotFoundFailure(String super.message);
}

class TagNotFoundFailure extends Failure {
  const TagNotFoundFailure(String super.message);
}

class ReminderNotFoundFailure extends Failure {
  const ReminderNotFoundFailure(String super.message);
}

class CacheFailure extends Failure {
  const CacheFailure(String super.message);
}

class NetworkFailure extends Failure {
  const NetworkFailure(String super.message);
}

class AuthenticationNotFoundFailure extends Failure {
  const AuthenticationNotFoundFailure(String super.message);
}

class TaskNotFoundFailure extends Failure {
  const TaskNotFoundFailure(String super.message);
}

class IncompleteDataFailure extends Failure {
  const IncompleteDataFailure(String super.message);
}

class DatabaseFailure extends Failure {
  const DatabaseFailure(String super.message);
}

class ReauthenticationRequiredFailure extends Failure {
  const ReauthenticationRequiredFailure(String super.message);
}

class AuthenticationFailure extends Failure {
  const AuthenticationFailure(String super.message);
}

class NoActiveSessionFailure extends Failure {
  const NoActiveSessionFailure(String super.message);
}
