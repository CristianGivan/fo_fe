import 'package:fo_fe/core/widgets/core_widget_exports.dart';
import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';
import 'package:fo_fe/features/organizer/utils/set_and_list/organizer_items_transform.dart';

import '../../../../presentation/pages/item/item_card.dart';

class TaskDeleteScreen extends StatefulWidget {
  const TaskDeleteScreen({super.key});

  @override
  _TaskDeleteScreenState createState() => _TaskDeleteScreenState();
}

class _TaskDeleteScreenState extends State<TaskDeleteScreen> {
  late IdSet selectedIds;
  late OrganizerItems<TaskDto> selectedTaskDtoList;

  @override
  void initState() {
    super.initState();
    final state = context.read<TaskBloc>().state;
    if (state.status == OrganizerBlocStatus.loaded) {
      selectedTaskDtoList = state.displayedItems.convertWithSelected<TaskDto>();
      selectedIds = IdSet.fromOrganizerItems(selectedTaskDtoList);
    } else {
      selectedIds = IdSet.empty();
      selectedTaskDtoList = OrganizerItems.empty();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppContentScreen(
      appBarTitle: TaskStrings().screenDeleteTitle,
      body: _buildTaskListDto(),
      menuOptions: (context, userId) =>
          TaskDeleteScreenActionsMenu.getMenuItems(context, selectedIds),
      onSearchSubmitted: () {},
    );
  }

  Widget _buildTaskListDto() {
    if (selectedTaskDtoList.isEmpty) {
      return Center(child: Text('No items to display'));
    } else {
      return ItemListViewPage<TaskDto>(
        itemsDto: selectedTaskDtoList,
        itemCardBuilder: (itemDto) => ItemCard<TaskDto>(itemDto),
        value: _isSelected,
        onChange: _updateTaskUserLink,
      );
    }
  }

  bool _isSelected(TaskDto taskDto) {
    return taskDto.taskUserLink.isSelectedByUser;
  }

  void _updateTaskUserLink(BuildContext context, TaskDto taskDto, bool value) {
    setState(() {
      if (value) {
        selectedTaskDtoList = selectedTaskDtoList.copyWithAddedItem(taskDto);
        selectedIds = IdSet.fromOrganizerItems(selectedTaskDtoList);
      } else {
        selectedTaskDtoList = selectedTaskDtoList.copyWithRemovedItem(taskDto);
        selectedIds = IdSet.fromOrganizerItems(selectedTaskDtoList);
      }
    });
  }
}
