// lib/presentation/screens/task_export_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/core/widgets/core_widget_exports.dart';
import 'package:fo_fe/features/organizer/all_items/task/domain/usecases/export_task_to_excel_use_case.dart';
import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';
import 'package:get_it/get_it.dart';

class TaskExportScreen extends StatelessWidget {
  final ExportTaskToExcelUseCase _taskExportService = GetIt.instance<ExportTaskToExcelUseCase>();

  TaskExportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppContentScreen(
      appBarTitle: 'Export Tasks',
      body: _buildExportExcel(context, 1),
      menuOptions: (context, uiserId) => [],
      onSearchSubmitted: () {},
    );
  }

  Widget _buildExportExcel(BuildContext context, int forUserId) {
    return Center(
      child: ElevatedButton(
        onPressed: () async {
          final displayItems = context.read<TaskBloc>().state.originalItems;
          context
              .read<TaskBloc>()
              .add(ExportTaskToExcelBlocEvent(TaskParams(id: 0, taskItems: displayItems)));
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
