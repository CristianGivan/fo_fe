import 'package:fo_fe/features/organizer/items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/presentation/pages/item_with_items_page.dart';
import 'package:fo_fe/features/organizer/utils/other/items_type_selection.dart';

import '../../../../utils/organizer_exports.dart';

class TaskLinkTagPage extends StatefulWidget {
  final TaskEntity task;

  const TaskLinkTagPage({super.key, required this.task});

  @override
  State<TaskLinkTagPage> createState() => _TaskLinkTagPageState();
}

class _TaskLinkTagPageState extends State<TaskLinkTagPage> {
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
