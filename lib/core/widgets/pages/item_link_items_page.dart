import 'package:fo_fe/core/widgets/pages/link_item_list_view_page.dart';
import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/presentation/bloc/link_bloc_derive/item_link_bloc_factory.dart';
import 'package:fo_fe/features/organizer/presentation/bloc/organizer_link_bloc.dart';
import 'package:fo_fe/features/organizer/presentation/bloc/organizer_link_bloc_event.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class ItemLinkItemsPage<T extends OrganizerItemEntity> extends StatelessWidget {
  final ItemParams params;

  const ItemLinkItemsPage({super.key, required this.params});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OrganizerLinkBloc<T>>(
      create: (context) => createItemLinkBloc<T>(params),
      child: BlocConsumer<OrganizerLinkBloc<T>, OrganizerBlocState<T>>(
        listener: (context, state) {},
        builder: (context, state) {
          final itemLinkItemsBloc = context.read<OrganizerLinkBloc<T>>();
          //todo -do- a way to update the items with recived data
          // if (state.status == OrganizerBlocStatus.initial) {
          itemLinkItemsBloc.add(GetItemsOfItemBlocEvent(params));
          // }
          return buildStateWidget(
            state: state,
            buildErrorState: _buildErrorState,
            buildLoadingState: _buildLoadingState,
            buildLoadedState: () => _buildItemsListPage(context, state.displayedItems),
          );
        },
      ),
    );
  }

  Widget _buildErrorState(String? message) =>
      Center(child: Text(message ?? "Unknown error occurred"));

  Widget _buildLoadingState() => const Center(child: CircularProgressIndicator());

  Widget _buildItemsListPage(BuildContext context, OrganizerItems<T> items) {
    return Column(
      children: [
        if (items.isEmpty)
          Center(child: Text('No Available'))
        else
          LinkItemListViewPage<T>(itemList: items),
        ElevatedButton(
          onPressed: () => _pushNamed(context),
          child: Text('Update'),
        ),
      ],
    );
  }

  // todo -do- a way to update the items with recived data mor as polymorfism

  Future<Object?> _pushNamed(BuildContext context) {
    switch (params.itemType) {
      case ItemType.taskTag:
        return context.pushNamed(TaskRouterNames.taskUpdateTagRouteName, extra: params.id);
      case ItemType.taskUser:
        {
          return context.pushNamed(TaskRouterNames.taskUpdateUserRouteName, extra: params.id);
        }
      case ItemType.undefine:
        // TODO: Handle this case.
        throw UnimplementedError();
      case ItemType.task:
        // TODO: Handle this case.
        throw UnimplementedError();
      case ItemType.tag:
        // TODO: Handle this case.
        throw UnimplementedError();
      case ItemType.reminder:
        // TODO: Handle this case.
        throw UnimplementedError();
      case ItemType.user:
        // TODO: Handle this case.
        throw UnimplementedError();
      case ItemType.taskReminder:
        // TODO: Handle this case.
        throw UnimplementedError();
    }
  }
}
