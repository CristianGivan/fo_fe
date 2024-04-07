import 'package:equatable/equatable.dart';

class User extends Equatable {
  final _id;

  const User({int id = 0}) : _id = id;

  @override
  // TODO: implement props
  List<Object?> get props => [_id];
}
