part of 'item_link_items_bloc.dart';

class ItemLinkUserBlocState extends OrganizerBlocState<UserEntity> {
  final String? errorMessage;

  ItemLinkUserBlocState({
    required super.status,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [
        status,
        errorMessage,
      ];
}

class ItemLinkTagBlocState extends OrganizerBlocState<TagEntity> {
  final String? errorMessage;

  ItemLinkTagBlocState({
    required super.status,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [
        status,
        errorMessage,
      ];
}
