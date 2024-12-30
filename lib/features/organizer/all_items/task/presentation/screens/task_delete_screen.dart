import 'package:fo_fe/core/widgets/core_widget_exports.dart';
import 'package:fo_fe/features/organizer/all_items/task/presentation/pages/task_card_page.dart';
import 'package:fo_fe/features/organizer/all_items/task/presentation/widgets/task_delete_screen_actions_menu.dart';
import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';
import 'package:fo_fe/features/organizer/utils/set_and_list/organizer_items_transform.dart';

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
    selectedIds = IdSet.empty();
    selectedTaskDtoList = OrganizerItems.empty();
  }

  @override
  Widget build(BuildContext context) {
    return AppContentScreen(
      appBarTitle: TaskStrings().screenEditTitle,
      body: _buildStateWidget(),
      menuOptions: (context, userId) =>
          TaskDeleteScreenActionsMenu.getMenuItems(context, selectedIds),
      onSearchSubmitted: () {},
    );
  }

  Widget _buildStateWidget() {
    return BlocBuilder<TaskBloc, OrganizerBlocState>(builder: (context, state) {
      return buildStateWidget(
        state: state,
        buildErrorState: _buildErrorState,
        buildLoadingState: _buildLoadingState,
        buildLoadedState: () => _buildTaskListDto(context, state.displayedItems),
      );
    });
  }

  Widget _buildErrorState(String? message) =>
      Center(child: Text(message ?? "Unknown error occurred"));

  Widget _buildLoadingState() => const Center(child: CircularProgressIndicator());

  Widget _buildTaskListDto(BuildContext context, OrganizerItems<ItemEntity> itemList) {
    selectedTaskDtoList = itemList.convertWithSelected<TaskDto>();
    if (selectedTaskDtoList.isEmpty) {
      return Center(child: Text('No items to display'));
    } else {
      return ItemDtoListViewPage<TaskDto>(
        itemDtoList: selectedTaskDtoList,
        itemCardBuilder: (itemDto) => TaskCard(itemDto.task),
        getValue: _getValue,
        updateItemUserLink: _updateTaskUserLink,
      );
    }
  }

  bool _getValue(TaskDto taskDto) {
    return taskDto.taskUserLink.isSelectedByUser;
  }

  void _updateTaskUserLink(BuildContext context, TaskDto taskDto, bool value) {
    setState(() {
      if (value) {
        selectedIds = (selectedIds.toBuilder()..add(taskDto.task.id)).build();
      } else {
        selectedIds = (selectedIds.toBuilder()..remove(taskDto.task.id)).build();
        selectedTaskDtoList = selectedTaskDtoList.copyWithRemovedItem(taskDto);
      }
    });
  }
}
