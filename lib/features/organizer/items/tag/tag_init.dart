import 'package:fo_fe/features/organizer/items/tag/data/datasources/tag_local_data_source_drift.dart';
import 'package:fo_fe/features/organizer/items/tag/data/repositories/tag_repository_drift.dart';
import 'package:fo_fe/features/organizer/items/tag/tag_exports.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void tagInit() {
  // Tag BLoCs
  sl.registerFactory(() => TagBlocTag(
        insertTag: sl(),
        updateTag: sl(),
        deleteTag: sl(),
        getTagById: sl(),
        getTagItemsAll: sl(),
        getTagItemsByIdSet: sl(),
      ));

  // Tag Use cases
  sl.registerLazySingleton(() => InsertTag(sl()));
  sl.registerLazySingleton(() => UpdateTag(sl()));
  sl.registerLazySingleton(() => DeleteTag(sl()));
  sl.registerLazySingleton(() => GetTagById(sl()));
  sl.registerLazySingleton(() => GetTagItemsAll(sl()));
  sl.registerLazySingleton(() => GetTagItemsByIdSet(sl()));

  // Tag Repository
  sl.registerLazySingleton<TagRepository>(() => TagRepositoryDrift(
        localDataSource: sl<TagLocalDataSourceDrift>(),
      ));

  // Tag Data Source
  sl.registerLazySingleton<TagLocalDataSourceDrift>(
      () => TagLocalDataSourceDrift(tagDaoDrift: sl()));
}
