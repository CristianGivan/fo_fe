part of 'tag_bloc.dart';

abstract class TagBlocState extends Equatable {
  const TagBlocState();

  @override
  List<Object> get props => [];
}

class TagInitial extends TagBlocState {}

class TagLoading extends TagBlocState {}

class TagItemsLoadedBlocState extends TagBlocState {
  final OrganizerItems<TagEntity> tagItems;

  TagItemsLoadedBlocState(this.tagItems);

  @override
  List<Object> get props => [tagItems];
}

class TagError extends TagBlocState {
  final String message;

  TagError(this.message);

  @override
  List<Object> get props => [message];
}

class TagSuccess extends TagBlocState {
  final int id;

  TagSuccess(this.id);

  @override
  List<Object> get props => [id];
}

class SingleTagLoaded extends TagBlocState {
  final TagEntity tag;

  SingleTagLoaded(this.tag);

  @override
  List<Object> get props => [tag];
}
