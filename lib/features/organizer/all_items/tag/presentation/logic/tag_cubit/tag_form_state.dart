part of 'tag_form_cubit.dart';

class TagFormState extends Equatable {
  final String subject;

  const TagFormState({this.subject = ''});

  TagFormState copyWith({String? subject}) {
    return TagFormState(
      subject: subject ?? this.subject,
    );
  }

  @override
  List<Object> get props => [subject];
}
