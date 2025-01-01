// lib/presentation/screens/task_export_screen.dart
import 'package:flutter/material.dart';
import 'package:fo_fe/core/widgets/core_widget_exports.dart';
import 'package:fo_fe/features/organizer/all_items/task/utils/other/task_export_to_excel_service.dart';
import 'package:get_it/get_it.dart';

class TaskExportScreen extends StatelessWidget {
  final TaskExportService _taskExportService = GetIt.instance<TaskExportService>();

  @override
  Widget build(BuildContext context) {
    return AppContentScreen(
      appBarTitle: 'Export Tasks',
      body: _buildExportExcel(context, 1),
      menuOptions: (context, uiserId) => [],
      onSearchSubmitted: () {},
    );
  }

  Widget _buildExportExcel(BuildContext context, int userId) {
    return Center(
      child: ElevatedButton(
        onPressed: () async {
          await _taskExportService.exportTasksToExcel(userId);
          SnackBarWidget.showAboveBottomNavBar(
            context,
            content: 'Export completed',
            backgroundColor: Colors.green,
          );
        },
        child: Text('Export Tasks to Excel'),
      ),
    );
  }
}
