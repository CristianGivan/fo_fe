part of 'tag_bloc.dart';

abstract class TagBlocEvent extends Equatable {
  const TagBlocEvent();

  @override
  List<Object> get props => [];
}

class AddTagBlocEvent extends TagBlocEvent {
  final TagEntity tag;

  AddTagBlocEvent(this.tag);

  @override
  List<Object> get props => [tag];
}

class UpdateTagBlocEvent extends TagBlocEvent {
  final TagEntity tag;

  UpdateTagBlocEvent(this.tag);

  @override
  List<Object> get props => [tag];
}

class DeleteTagBlocEvent extends TagBlocEvent {
  final int tagId;

  DeleteTagBlocEvent(this.tagId);

  @override
  List<Object> get props => [tagId];
}

class GetTagByIdBlocEvent extends TagBlocEvent {
  final int id;

  GetTagByIdBlocEvent(this.id);

  @override
  List<Object> get props => [id];
}

class GetTagItemsAllBlocEvent extends TagBlocEvent {}

class GetTagItemsByIdSetBlocEvent extends TagBlocEvent {
  final IdSet idSet;

  GetTagItemsByIdSetBlocEvent(this.idSet);

  @override
  List<Object> get props => [idSet];
}
