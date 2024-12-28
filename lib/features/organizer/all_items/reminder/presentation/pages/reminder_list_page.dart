import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/features/organizer/all_items/reminder/utils/reminder_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class ReminderListPage extends StatelessWidget {
  final Function(ReminderEntity) onSelectReminder;
  final OrganizerItems<ReminderEntity> selectedReminders;

  ReminderListPage({
    Key? key,
    required this.onSelectReminder,
    required this.selectedReminders,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReminderBloc, ReminderBlocState>(
      builder: (context, state) {
        if (state is ReminderLoadingBlocState) {
          return _buildLoadingIndicator();
        } else if (state is ReminderItemsLoadedBlocState) {
          return _buildReminderList(state);
        } else if (state is ReminderErrorBlocState) {
          return _buildErrorMessage(state);
        } else {
          return _buildNoRemindersMessage();
        }
      },
    );
  }

  Widget _buildLoadingIndicator() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _buildReminderList(ReminderItemsLoadedBlocState state) {
    return ListView.builder(
      itemCount: state.reminderItems.size(),
      itemBuilder: (context, index) {
        final reminder = state.reminderItems.getAt(index);
        final isSelected = selectedReminders.contains(reminder);

        return ListTile(
          title: Text(reminder.subject),
          subtitle: Text(reminder.remindAt.toString()),
          trailing: Icon(
            isSelected ? Icons.check_box : Icons.check_box_outline_blank,
          ),
          onTap: () => onSelectReminder(reminder),
        );
      },
    );
  }

  Widget _buildErrorMessage(ReminderErrorBlocState state) {
    return Center(child: Text(state.message));
  }

  Widget _buildNoRemindersMessage() {
    return const Center(child: Text('No Reminders Available'));
  }
}
