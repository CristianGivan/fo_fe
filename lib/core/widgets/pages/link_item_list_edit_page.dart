import 'package:fo_fe/core/widgets/core_widget_exports.dart';
import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/presentation/bloc/organizer_link_bloc_event.dart';

import '../../../features/organizer/utils/organizer_exports.dart';

class LinkItemListEditPage extends StatefulWidget {
  final TaskParams params;

  LinkItemListEditPage({required this.params});

  @override
  _LinkItemListEditPageState createState() => _LinkItemListEditPageState();
}

class _LinkItemListEditPageState extends State<LinkItemListEditPage> {
  late OrganizerItems allItems;
  late OrganizerItems selectedItems;
  late OrganizerItems<OrganizerItemEntity> checkedItems;
  late OrganizerItems<OrganizerItemEntity> uncheckedItems;

  @override
  void initState() {
    super.initState();
    _sendGetRequest();
  }

  void _sendGetRequest() {
    final taskUserLinkBloc = context.read<TaskUserLinkBloc>();
    if (taskUserLinkBloc.state.status != OrganizerBlocStatus.loaded) {
      taskUserLinkBloc.add(GetLinkItemsByItemIdBlocEvent(widget.params));
    } else {
      setState(() {
        checkedItems = taskUserLinkBloc.state.displayedItems;
        uncheckedItems = OrganizerItems.empty();
      });
    }
  }

  void _onItemCheckedChanged(OrganizerItemEntity item, bool isChecked) {
    setState(() {
      if (isChecked) {
        uncheckedItems = uncheckedItems.copyWithRemovedItem(item);
        checkedItems = checkedItems.copyWithAddedItem(item);
      } else {
        checkedItems = checkedItems.copyWithRemovedItem(item);
        uncheckedItems = uncheckedItems.copyWithAddedItem(item);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppContentScreen(
      appBarTitle: TaskStrings().screenEditTitle,
      body: _buildPage(),
      menuOptions: (context, userId) => [],
      onSearchSubmitted: () {},
    );
  }

  Column _buildPage() {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: checkedItems.size(),
            itemBuilder: (context, index) =>
                _buildCheckboxListTitle(context, checkedItems.getAt(index), true),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: uncheckedItems.size(),
            itemBuilder: (context, index) =>
                _buildCheckboxListTitle(context, uncheckedItems.getAt(index), false),
          ),
        ),
      ],
    );
  }

  Widget _buildCheckboxListTitle(BuildContext context, OrganizerItemEntity item, bool isChecked) {
    return CheckboxListTile(
      title: Text(item.subject),
      value: isChecked,
      onChanged: (bool? value) {
        if (value != null) {
          _onItemCheckedChanged(item, value);
        }
      },
    );
  }
}
