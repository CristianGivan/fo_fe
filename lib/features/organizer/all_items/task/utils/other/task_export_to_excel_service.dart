import 'package:excel/excel.dart';
import 'package:fo_fe/core/utils/backup/export_to_excel/export_itmes_to_excel.dart';
import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';
import 'package:fo_fe/features/organizer/utils/set_and_list/organizer_items_transform.dart';

class TaskExportService {
  final GetItemsFromLogInUserUseCase<TaskDto, TaskParams> getTaskItemsFromLogInUserUseCase;

  TaskExportService(this.getTaskItemsFromLogInUserUseCase);

  Future<void> exportTasksToExcel(int userId) async {
    final sheetName = 'Tasks';
    final params = TaskParams(forUserId: userId);
    final result = await getTaskItemsFromLogInUserUseCase(params);
    result.fold(
      (failure) => throw Exception('Failed to fetch tasks'),
      (taskItems) async => ExportToExcel.exportItemsToExcel(
        sheetName,
        _tableRows(taskItems.convertTo<TaskDto>()),
      ),
    );
  }

  List<List<CellValue?>> _tableRows(OrganizerItems<TaskDto> taskItems) {
    List<List<CellValue?>> rows = taskItems.map((taskDto) => _tableRow(taskDto)).toList();
    rows.insert(0, _tableHeader());
    return rows;
  }

  List<CellValue?> _tableHeader() {
    return [
      TextCellValue('Task ID'),
      TextCellValue('Task Remote ID'),
      TextCellValue('Task Subject'),
      TextCellValue('User Link ID'),
      TextCellValue('Is Selected By User'),
    ];
  }

  List<CellValue?> _tableRow(TaskDto taskDto) {
    return [
      IntCellValue(taskDto.task.id),
      IntCellValue(taskDto.task.remoteId),
      TextCellValue(taskDto.task.subject),
      IntCellValue(taskDto.taskUserLink.id),
      BoolCellValue(taskDto.taskUserLink.isSelectedByUser),
    ];
  }
}
