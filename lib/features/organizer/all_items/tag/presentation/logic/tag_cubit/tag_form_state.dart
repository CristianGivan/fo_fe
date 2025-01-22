part of 'tag_form_cubit.dart';

class TagFormState extends Equatable {
  final String tagName;

  const TagFormState({this.tagName = ''});

  TagFormState copyWith({String? tagName}) {
    return TagFormState(
      tagName: tagName ?? this.tagName,
    );
  }

  @override
  List<Object> get props => [tagName];
}
