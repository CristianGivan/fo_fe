import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/db/drift/organizer_drift_exports.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/config/organizer_item_export.dart';
import 'package:fo_fe/features/organizer/items/reminder/utils/reminder_exports.dart';

class ReminderRepositoryDrift implements ReminderRepository {
  final ReminderLocalDataSource localDataSource;

  ReminderRepositoryDrift({required this.localDataSource});

  @override
  Future<Either<Failure, int>> addReminder(ReminderEntity reminder) async {
    return _handleDatabaseOperation(() {
      final companion = ReminderMapper.entityToCompanion(reminder);
      _checkItemNotNull(companion);
      return localDataSource.addReminder(companion);
    });
  }

  @override
  Future<Either<Failure, bool>> updateReminder(ReminderEntity reminder) async {
    return _handleDatabaseOperation(() {
      final companion = ReminderMapper.entityToCompanion(reminder);
      _checkItemNotNull(companion);
      return localDataSource.updateReminder(companion);
    });
  }

  @override
  Future<Either<Failure, int>> deleteReminder(int reminderId) {
    return _handleDatabaseOperation(
        () => localDataSource.deleteReminder(reminderId));
  }

  @override
  Future<Either<Failure, ReminderEntity>> getReminderById(int id) {
    return _handleDatabaseOperation(() async {
      final item = await localDataSource.getReminderById(id);
      _checkItemNotNull(item);
      return ReminderMapper.entityFromTableDrift(item!);
    });
  }

  @override
  Future<Either<Failure, OrganizerItems<ReminderEntity>>>
      getReminderItemsAll() {
    return _handleDatabaseOperation(() async {
      final items = await localDataSource.getReminderItemsAll();
      _checkItemsNotNullOrEmpty(items);
      return ReminderMapper.entityItemsFromTableDriftItems(items!);
    });
  }

  @override
  Future<Either<Failure, OrganizerItems<ReminderEntity>>>
      getReminderItemsByIdSet(IdSet idSet) {
    return _handleDatabaseOperation(() async {
      final items = await localDataSource.getReminderItemsByIdSet(idSet);
      _checkItemsNotNullOrEmpty(items);

      final nonNullItems = _filterNonNullItems<ReminderTableDriftG>(items!);
      return ReminderMapper.entityItemsFromTableDriftItems(nonNullItems);
    });
  }

  Future<Either<Failure, T>> _handleDatabaseOperation<T>(
      Future<T> Function() operation) async {
    try {
      final result = await operation();
      return Right(result);
    } catch (e) {
      if (e is Failure) {
        return Left(e);
      } else {
        return Left(LocalFailure(e.toString()));
      }
    }
  }

  void _checkItemNotNull(dynamic item) {
    if (item == null) {
      throw const ReminderNotFoundFailure("Reminder not found");
    }
  }

  void _checkItemsNotNullOrEmpty(List<dynamic>? items) {
    if (items == null || items.isEmpty) {
      throw const ReminderNotFoundFailure("No reminders found");
    }
  }

  List<T> _filterNonNullItems<T>(List<dynamic> items) {
    final nonNullItems = items.whereType<T>().toList();
    if (nonNullItems.length != items.length) {
      throw const IncompleteDataFailure("Incomplete data found");
    }

    if (nonNullItems.isEmpty) {
      throw const ReminderNotFoundFailure("No items found");
    }

    return nonNullItems;
  }
}
