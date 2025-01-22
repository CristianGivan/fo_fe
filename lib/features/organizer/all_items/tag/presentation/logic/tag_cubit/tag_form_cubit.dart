import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tag_form_state.dart';

class TagFormCubit extends Cubit<TagFormState> {
  TagFormCubit() : super(TagFormState());

  void updateTagName(String tagName) {
    emit(state.copyWith(tagName: tagName));
  }
}
