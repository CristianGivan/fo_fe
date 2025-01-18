import 'package:fo_fe/core/db/drift/organizer_drift_db.dart';
import 'package:fo_fe/features/organizer/all_items/tag/data/datasources/tag_local_data_source_drift.dart';
import 'package:fo_fe/features/organizer/all_items/tag/data/repositories/tag_repository_drift.dart';
import 'package:fo_fe/features/organizer/all_items/tag/presentation/bloc/tag_bloc/tag_bloc.dart';
import 'package:fo_fe/features/organizer/all_items/tag/presentation/cubit/tag_cubit.dart';
import 'package:fo_fe/features/organizer/all_items/tag/utils/tag_exports.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void tagInit() {
  // Tag Data Source
  sl.registerLazySingleton<TagLocalDataSourceDrift>(
      () => TagLocalDataSourceDrift(db: sl<OrganizerDriftDB>()));

  // Tag Repository
  sl.registerLazySingleton<TagRepository>(() => TagRepositoryDrift(
        localDataSource: sl<TagLocalDataSourceDrift>(),
      ));

  // Tag Use cases
  sl.registerLazySingleton(() => AddTagUseCase(sl()));
  sl.registerLazySingleton(() => UpdateTagUseCase(sl()));
  sl.registerLazySingleton(() => DeleteTagUseCase(sl()));
  sl.registerLazySingleton(() => GetTagByIdUseCase(sl()));
  sl.registerLazySingleton(() => GetTagItemsAllUseCase(sl()));
  sl.registerLazySingleton(() => GetTagEntitiesByIdSetUseCase(sl()));

  // Tag BLoCs
  sl.registerFactory(() => TagBlocTag(
        addTag: sl(),
        updateTag: sl(),
        deleteTag: sl(),
        getTagById: sl(),
        getTagItemsAll: sl(),
        getTagItemsByIdSet: sl(),
      ));
  sl.registerFactory(() => TagBloc(
        addTag: sl(),
        deleteTag: sl(),
        getTags: sl(),
      ));

  // Tag Cubit
  sl.registerFactory(() => TagCubit(
        getEntitiesFromUserUseCase: sl(),
      ));
}
