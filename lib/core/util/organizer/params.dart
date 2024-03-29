import 'package:equatable/equatable.dart';
import 'package:fo_fe/core/util/organizer/id_set.dart';

import 'filter_criteria.dart';
import 'sorting_criteria.dart';

class Params extends Equatable {
  //both id and idSet are non-nullable because it should checked in repository
  final int id;
  final IdSet idSet;
  final FilterCriteria filterCriteria;
  final SortingCriteria sortingCriteria;

  const Params({
    required this.id,
    required this.idSet,
    this.filterCriteria = const NoFilter(),
    this.sortingCriteria = SortingCriteria.none,
  });

  @override
  List<Object?> get props => [idSet, filterCriteria, sortingCriteria];

  // Factory for single ID
  factory Params.withSingleId(int id) {
    return Params(
      id: id,
      idSet: IdSet.empty(),
    );
  }

  // Factory for multiple IDs
  factory Params.withIdSet(IdSet ids) {
    return Params(
        id: ids.first, //todo should be first or null?
        idSet: ids);
  }
}
