import 'package:fo_fe/features/organizer/presentation/pages/item_link/item_link_items_update_page.dart';
import 'package:fo_fe/features/organizer/presentation/pages/item_link/link_item_list_view_page.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class ItemLinkItemsViewPage<T extends ItemEntity> extends StatelessWidget {
  final ItemLinkParams params;

  const ItemLinkItemsViewPage({super.key, required this.params});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrganizerLinkBloc<T>, OrganizerBlocState<T>>(
      listener: (context, state) {},
      builder: (context, state) {
        final itemLinkItemsBloc = context.read<OrganizerLinkBloc<T>>();
        if (state.status == OrganizerBlocStatus.initial) {
          itemLinkItemsBloc.add(GetItemsOfItemBlocEvent(params));
        }
        return buildBlocStateWidget(
          state: state,
          buildErrorState: _buildErrorState,
          buildLoadingState: _buildLoadingState,
          buildLoadedState: () => _buildItemsListPage(context, state.displayedItems),
        );
      },
    );
  }

  Widget _buildErrorState(String? message) =>
      Center(child: Text(message ?? "Unknown error occurred"));

  Widget _buildLoadingState() => const Center(child: CircularProgressIndicator());

  Widget _buildItemsListPage(BuildContext context, OrganizerItems<T> items) {
    return Column(
      children: [
        if (items.isEmpty)
          const Center(child: Text('No Available'))
        else
          LinkItemListViewPage<T>(itemList: items),
        ElevatedButton(
          onPressed: () {
            _pushUpdateItems(context, items);
          },
          child: const Text('Update'),
        ),
      ],
    );
  }

// todo -refactor- find a batter way to navigate to the update page
  void _pushUpdateItems(BuildContext context, OrganizerItems<T> items) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => BlocProvider.value(
        value: context.read<OrganizerLinkBloc<T>>(),
        child: ItemLinkItemsUpdatePage<T>(params: params, initSelectedItems: items),
      ),
    ));
  }
}
