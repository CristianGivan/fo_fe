import 'package:equatable/equatable.dart';

class NoParams extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetByIdParams extends Equatable {
  final int id;

  const GetByIdParams({required this.id});

  @override
  List<Object> get props => [id];
}
