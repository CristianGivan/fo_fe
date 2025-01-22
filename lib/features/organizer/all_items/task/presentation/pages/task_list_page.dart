import 'package:fo_fe/core/widgets/pages/item_list_view_page.dart';
import 'package:fo_fe/features/organizer/all_items/task/presentation/pages/task_card_page.dart';
import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';
import 'package:fo_fe/features/organizer/utils/set_and_list/organizer_items_transform.dart';

class TaskListPage extends StatelessWidget {
  const TaskListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, OrganizerBlocState>(builder: (context, state) {
      return buildBlocStateWidget(
        state: state,
        buildLoadedState: () => _buildTaskListDto(context, state.displayedItems),
      );
    });
  }

  Widget _buildTaskListDto(BuildContext context, OrganizerItems<ItemEntity> itemList) {
    final taskDtoList = itemList.convertTo<TaskDto>();
    if (taskDtoList.isEmpty) {
      return Center(child: Text('No items to display'));
    } else {
      return ItemListViewPage<TaskDto>(
        itemDtoList: taskDtoList,
        itemCardBuilder: (taskDto) => TaskCard(taskDto),
        value: _isSelected,
        updateItemUserLink: _updateTaskUserLink,
      );
    }
  }

  bool _isSelected(TaskDto taskDto) {
    return taskDto.taskUserLink.isSelectedByUser;
  }

  void _updateTaskUserLink(BuildContext context, TaskDto taskDto, bool value) {
    final updatedTaskUserLink = taskDto.taskUserLink.copyWith(isSelectedByUser: value);
    context.read<TaskBloc>().add(UpdateTaskBlocEvent(TaskParams(
          id: taskDto.id,
          taskDto: taskDto,
          taskUserLinkEntity: updatedTaskUserLink,
        )));
  }
}
