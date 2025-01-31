import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tag_form_state.dart';

class TagFormCubit extends Cubit<TagFormState> {
  TagFormCubit() : super(TagFormState());

  void updateSubject(String subject) {
    emit(state.copyWith(subject: subject));
  }
}
