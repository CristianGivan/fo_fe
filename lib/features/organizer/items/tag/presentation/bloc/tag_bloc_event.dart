part of 'tag_bloc.dart';

abstract class TagBlocEvent extends Equatable {
  const TagBlocEvent();

  @override
  List<Object> get props => [];
}

class InsertTagEvent extends TagBlocEvent {
  final TagEntity tag;

  InsertTagEvent(this.tag);

  @override
  List<Object> get props => [tag];
}

class UpdateTagEvent extends TagBlocEvent {
  final TagEntity tag;

  UpdateTagEvent(this.tag);

  @override
  List<Object> get props => [tag];
}

class DeleteTagEvent extends TagBlocEvent {
  final int tagId;

  DeleteTagEvent(this.tagId);

  @override
  List<Object> get props => [tagId];
}

class GetTagByIdEvent extends TagBlocEvent {
  final int id;

  GetTagByIdEvent(this.id);

  @override
  List<Object> get props => [id];
}

class GetTagItemsAllEvent extends TagBlocEvent {}

class GetTagItemsByIdSetEvent extends TagBlocEvent {
  final IdSet idSet;

  GetTagItemsByIdSetEvent(this.idSet);

  @override
  List<Object> get props => [idSet];
}
