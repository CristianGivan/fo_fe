

import 'package:equatable/equatable.dart';

class User extends Equatable{
  int id;

  User(this.id);

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}
