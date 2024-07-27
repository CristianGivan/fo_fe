import 'package:fo_fe/core/db/drift/organizer_drift_db.dart';
import 'package:fo_fe/features/organizer/items/tag/config/tag_exports.dart';
import 'package:fo_fe/features/organizer/items/tag/data/datasources/tag_local_data_source_drift.dart';
import 'package:fo_fe/features/organizer/items/tag/data/repositories/tag_repository_drift.dart';
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
  sl.registerLazySingleton(() => InsertTag(sl()));
  sl.registerLazySingleton(() => UpdateTag(sl()));
  sl.registerLazySingleton(() => DeleteTag(sl()));
  sl.registerLazySingleton(() => GetTagById(sl()));
  sl.registerLazySingleton(() => GetTagItemsAll(sl()));
  sl.registerLazySingleton(() => GetTagItemsByIdSet(sl()));

  // Tag BLoCs
  sl.registerFactory(() => TagBlocTag(
        insertTag: sl(),
        updateTag: sl(),
        deleteTag: sl(),
        getTagById: sl(),
        getTagItemsAll: sl(),
        getTagItemsByIdSet: sl(),
      ));
}
