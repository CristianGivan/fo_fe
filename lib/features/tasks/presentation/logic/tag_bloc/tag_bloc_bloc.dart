import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fo_fe/features/tasks/domain/entities/tag.dart';
import 'package:fo_fe/main.dart';

part 'tag_bloc_event.dart';
part 'tag_bloc_state.dart';

class TagBloc extends Bloc<TagBlocEvent, TagBlocState> {
  TagBloc() : super(const TagBlocState()) {
    on<TagBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<TagInitialized>(_onStarted);
    on<TagAdded>(_onTagAdded);
    on<GetAllTag>(_onGetAllTag);
    on<GetTagListByTaskId>(_onGetTagListByTaskId);
  }

  Future<void> _onGetAllTag(GetAllTag event, Emitter<TagBlocState> emit) async {
    emit(state.copyWith(status: TagBlocStatus.loading));
    try {
      emit(state.copyWith(
          tagList: await database.getAllTags(), status: TagBlocStatus.success));
    } catch (e) {
      emit(state.copyWith(status: TagBlocStatus.error));
    }
  }

  void _onStarted(TagInitialized event, Emitter<TagBlocState> emit) {
    if (state.status == TagBlocStatus.success) return;
    emit(state.copyWith(tagList: state.tagList, status: TagBlocStatus.success));
  }

  void _onTagAdded(TagAdded event, Emitter<TagBlocState> emit) {
    emit(state.copyWith(status: TagBlocStatus.loading));
    try {
      Set<Tag> temp = <Tag>{};
      temp.addAll(state.tagList);
      temp.add(event.tag);
      emit(state.copyWith(tagList: temp, status: TagBlocStatus.success));
    } catch (e) {
      emit(state.copyWith(status: TagBlocStatus.error));
    }
  }

  Future<void> _onGetTagListByTaskId(
      GetTagListByTaskId event, Emitter<TagBlocState> emit) async {
    emit(state.copyWith(status: TagBlocStatus.loading));
    try {
      emit(state.copyWith(
          tagList: await database.getTagSetFromTaskId(event.taskId),
          status: TagBlocStatus.success));
    } catch (e) {
      emit(state.copyWith(status: TagBlocStatus.error));
    }
  }
}
