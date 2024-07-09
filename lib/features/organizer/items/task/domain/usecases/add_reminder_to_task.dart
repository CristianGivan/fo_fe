import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/features/organizer/items/reminder/domain/entities/reminder_entity.dart';
import 'package:fo_fe/features/organizer/items/task/domain/repositories/task_repository.dart';

class AddReminderToTask {
  final TaskRepository taskRepository;

  AddReminderToTask(this.taskRepository);

  Future<Either<Failure, void>> call(
      int taskId, ReminderEntity reminder) async {
    return await taskRepository.addReminderToTask(taskId, reminder.id);
  }
}
