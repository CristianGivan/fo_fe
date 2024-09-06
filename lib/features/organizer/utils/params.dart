import 'package:equatable/equatable.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/config/organizer_item_export.dart';

class Params extends Equatable {
  //both id and idSet are non-nullable because it should checked in repository
  final int id;
  final int id2;
  final IdSet idSet;
  final FilterCriteria filterCriteria;
  final SortingCriteria sortingCriteria;

  const Params({
    this.id = 0,
    this.id2 = 0,
    this.idSet = const IdSet.empty(),
    this.filterCriteria = const NoFilter(),
    this.sortingCriteria = SortingCriteria.none,
  });

  @override
  List<Object?> get props => [idSet, filterCriteria, sortingCriteria];

  // Factory for single ID
  factory Params.withSingleId(int id) {
    return Params(
      id: id,
      idSet: const IdSet.empty(),
    );
  }

  // Factory for multiple IDs
  factory Params.withIdSet(IdSet ids) {
    return Params(
        id: ids.first ?? 0, //todo should be first or null?
        idSet: ids);
  }
}
