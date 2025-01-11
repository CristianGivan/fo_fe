import 'package:fo_fe/core/widgets/pages/link_item_list_view_page.dart';
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
      create: (context) => createItemLinkBloc<T>(
          ItemsLinkParamsFactory.create(id: params.id, itemType: params.itemType)),
      child: BlocConsumer<OrganizerLinkBloc<T>, OrganizerBlocState<T>>(
        listener: (context, state) {},
        builder: (context, state) {
          final itemLinkItemsBloc = context.read<OrganizerLinkBloc<T>>();
          //todo -do- a way to update the items with recived data
          // if I delete the if I get all the time a send requiest fir geting
          if (state.status == OrganizerBlocStatus.initial) {
            itemLinkItemsBloc.add(GetItemsOfItemBlocEvent(
                ItemsLinkParamsFactory.create(id: params.id, itemType: params.itemType)));
          }
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
          onPressed: () => context.pushNamed(
              ItemsLinkParamsFactory.create(id: params.id, itemType: params.itemType)
                  .pushUpdateRoute,
              extra: params.id),
          child: Text('Update'),
        ),
      ],
    );
  }
}
