part of '../../../tag_lib.dart';

enum TagBlocStatus { initial, loading, success, error }

final class TagBlocState extends Equatable {
  const TagBlocState({
    this.status = TagBlocStatus.initial,
    this.tagList = const <Tag>{},
  });

  final TagBlocStatus status;
  final Set<Tag> tagList;

  TagBlocState copyWith({
    TagBlocStatus? status,
    Set<Tag>? tagList,
  }) {
    return TagBlocState(
      status: status ?? this.status,
      tagList: tagList ?? this.tagList,
    );
  }

  @override
  String toString() {
    return '''Tag List { status: $status, tag list length: ${tagList.length} }''';
  }

  @override
  List<Object> get props => [status, tagList];
}
