import 'package:fo_fe/core/widgets/core_widget_exports.dart';
import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/all_items/user/utils/user_exports.dart';
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
  late OrganizerItems<OrganizerItemEntity> selectedItemsChecked;
  late OrganizerItems<OrganizerItemEntity> selectedItemsUnchecked;
  late OrganizerItems<OrganizerItemEntity> allItemsChecked;
  late OrganizerItems<OrganizerItemEntity> allItemsUnchecked;

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
        selectedItemsChecked = taskUserLinkBloc.state.displayedItems;
        selectedItemsUnchecked = OrganizerItems.empty();
      });
    }

    final UserBloc userBloc = context.read<UserBloc>();
    if (userBloc.state is UserItemsLoadedBlocState) {
      var state = userBloc.state as UserItemsLoadedBlocState;
      setState(() {
        allItemsChecked = state.userItems;
        allItemsUnchecked = OrganizerItems.empty();
      });
    } else {
      userBloc.add(GetLinkedUserItemsBlocEvent(user: UserEntity(name: "name", id: 3)));
    }
  }

  void _onItemCheckedChanged(OrganizerItemEntity item, bool isChecked) {
    setState(() {
      if (isChecked) {
        selectedItemsUnchecked = selectedItemsUnchecked.copyWithRemovedItem(item);
        selectedItemsChecked = selectedItemsChecked.copyWithAddedItem(item);
      } else {
        selectedItemsChecked = selectedItemsChecked.copyWithRemovedItem(item);
        selectedItemsUnchecked = selectedItemsUnchecked.copyWithAddedItem(item);
      }
    });
  }

  void _handleStateChanges(dynamic state) {
    if (state.status == OrganizerBlocStatus.loaded) {
      setState(() {
        selectedItemsChecked = state.displayedItems;
        selectedItemsUnchecked = OrganizerItems.empty();
      });
    }
    if (state is UserItemsLoadedBlocState) {
      setState(() {
        allItemsChecked = state.userItems;
        allItemsUnchecked = OrganizerItems.empty();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppContentScreen(
      appBarTitle: TaskStrings().screenEditTitle,
      body: MultiBlocListener(
        listeners: [
          BlocListener<TaskUserLinkBloc, OrganizerBlocState<UserEntity>>(
            listener: (context, state) {
              _handleStateChanges(state);
            },
          ),
          BlocListener<UserBloc, UserBlocState>(
            listener: (context, state) {
              _handleStateChanges(state);
            },
          ),
        ],
        child: Column(
          children: [
            _blocBuilder(),
            _buildSelectedItemsUnchecked(),
            _buildAllItemsChecked(),
            _allItemsBlocBuilder(),
          ],
        ),
      ),
      menuOptions: (context, userId) => [],
      onSearchSubmitted: () {},
    );
  }

  Widget _blocBuilder() {
    return BlocBuilder<TaskUserLinkBloc, OrganizerBlocState>(
      builder: (context, state) {
        if (state.status == OrganizerBlocStatus.loading) {
          return Center(child: CircularProgressIndicator());
        } else if (state.status == OrganizerBlocStatus.loaded) {
          return _buildSelectedItemsChecked();
        } else if (state.status == OrganizerBlocStatus.error) {
          return _buildErrorState1(context, state);
        } else {
          return Container(); // Default case
        }
      },
    );
  }

  Widget _allItemsBlocBuilder() {
    return BlocBuilder<UserBloc, UserBlocState>(
      builder: (context, state) {
        if (state is UserLoadingBlocState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is UserItemsLoadedBlocState) {
          return _buildAllItemsUnchecked();
        } else if (state is UserErrorBlocState) {
          return _buildErrorState(context, state);
        } else {
          return Center(child: CircularProgressIndicator()); // Default case
        }
      },
    );
  }

  Widget _buildErrorState1(BuildContext context, OrganizerBlocState state) {
    return Center(child: Text('Error: '));
  }

  Widget _buildErrorState(BuildContext context, UserBlocState state) {
    return Center(child: Text('Error: '));
  }

  Column _buildSelectedItemsChecked() {
    return Column(
      children: [
        Expanded(
          child: _buildCheckedListView(selectedItemsChecked),
        ),
      ],
    );
  }

  Column _buildSelectedItemsUnchecked() {
    return Column(
      children: [
        Expanded(
          child: _buildUncheckedListView(selectedItemsUnchecked),
        ),
      ],
    );
  }

  Column _buildAllItemsChecked() {
    return Column(
      children: [
        Expanded(
          child: _buildCheckedListView(allItemsChecked),
        ),
      ],
    );
  }

  Column _buildAllItemsUnchecked() {
    return Column(
      children: [
        Expanded(
          child: _buildUncheckedListView(allItemsUnchecked),
        ),
      ],
    );
  }

  ListView _buildCheckedListView(OrganizerItems<OrganizerItemEntity> items) {
    return ListView.builder(
      itemCount: items.size(),
      itemBuilder: (context, index) => _buildCheckboxListTitle(context, items.getAt(index), true),
    );
  }

  ListView _buildUncheckedListView(OrganizerItems<OrganizerItemEntity> items) {
    return ListView.builder(
      itemCount: items.size(),
      itemBuilder: (context, index) => _buildCheckboxListTitle(context, items.getAt(index), false),
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
