import 'package:fo_fe/features/organizer/all_items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/presentation/pages/item_with_items_page.dart';

import '../../../../utils/organizer_exports.dart';

class TaskLinkTagPageOld extends StatefulWidget {
  final TaskEntity task;

  TaskLinkTagPageOld({super.key, required int taskId}) : task = TaskEntity(id: taskId);

  @override
  State<TaskLinkTagPageOld> createState() => _TaskLinkTagPageOldState();
}

class _TaskLinkTagPageOldState extends State<TaskLinkTagPageOld> {
  OrganizerItems<TagEntity> tagItems = OrganizerItems.empty();

  @override
  Widget build(BuildContext context) {
    context.read<TaskTagLinkBloc>().add(GetTagItemsByTaskIdBlocEvent(widget.task.id));
    return BlocBuilder<TaskTagLinkBloc, TaskTagLinkBlocState>(
      builder: (context, state) {
        if (state is TaskTagLoadingBlocState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is TaskTagLoadedBlocState) {
          tagItems = state.tagItems;
          return ItemWithItemsPage<TaskEntity, TagEntity>(
            item: widget.task,
            items: tagItems,
            type: ItemsTypeEnum.tag,
          );
        } else if (state is TagItemsUpdatedToTaskBlocState) {
          tagItems = state.tagItemsUpdated;
          return ItemWithItemsPage<TaskEntity, TagEntity>(
            item: widget.task,
            items: tagItems,
            type: ItemsTypeEnum.tag,
          );
        } else if (state is TaskTagErrorBlocState) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: Text('No Tags Available'));
        }
      },
    );
  }
}
