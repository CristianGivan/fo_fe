part of 'tag_bloc.dart';

abstract class TagBlocState extends Equatable {
  const TagBlocState();

  @override
  List<Object> get props => [];
}

class TagInitialBlocState extends TagBlocState {}

class TagLoadingBlocState extends TagBlocState {}

class TagItemsLoadedBlocState extends TagBlocState {
  final OrganizerItems<TagEntity> tagItems;

  TagItemsLoadedBlocState(this.tagItems);

  @override
  List<Object> get props => [tagItems];
}

class TagErrorBlocState extends TagBlocState {
  final String message;

  TagErrorBlocState(this.message);

  @override
  List<Object> get props => [message];
}

class TagSuccessBlocState extends TagBlocState {
  final int id;

  TagSuccessBlocState(this.id);

  @override
  List<Object> get props => [id];
}

class SingleTagLoadedBlocState extends TagBlocState {
  final TagEntity tag;

  SingleTagLoadedBlocState(this.tag);

  @override
  List<Object> get props => [tag];
}
