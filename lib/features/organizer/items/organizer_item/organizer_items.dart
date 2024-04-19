import 'package:equatable/equatable.dart';

import '../../../../core/util/organizer/id_set.dart';
import 'organizer_item.dart';
import 'organizer_items_builder.dart';

class OrganizerItems extends Equatable {
  // is not final because I need to change it
  final List<OrganizerItemEntity> _organizerItems;

  OrganizerItems._(this._organizerItems);

  factory OrganizerItems.empty() => OrganizerItems._([]);

  factory OrganizerItems.of(Iterable<OrganizerItemEntity> organizerItems) =>
      OrganizerItems._(
          organizerItems.whereType<OrganizerItemEntity>().toList());

  OrganizerItemsBuilder toBuilder() =>
      OrganizerItemsBuilder.of(_organizerItems);

  List<OrganizerItemEntity> toList() => _organizerItems.toList();

  int size() => _organizerItems.length;

  int indexOf(OrganizerItemEntity organizerItem) {
    return _organizerItems.indexOf(organizerItem);
  }

  OrganizerItemEntity getAt(int index) => _organizerItems[index];

  bool isEmpty() {
    return _organizerItems.isEmpty;
  }

  bool contains(OrganizerItemEntity organizerItem) {
    return _organizerItems.contains(organizerItem);
  }

  bool any(bool Function(OrganizerItemEntity element) test) {
    return _organizerItems.any(test);
  }

  bool every(bool Function(OrganizerItemEntity element) test) =>
      _organizerItems.every(test);

  List<R> map<R>(R Function(OrganizerItemEntity) f) =>
      _organizerItems.map(f).toList();

  OrganizerItems filterByIdSet(IdSet idSet) {
    final filteredItems =
        _organizerItems.where((element) => idSet.contains(element.id)).toList();
    return OrganizerItems.of(filteredItems);
  }

  @override
  List<Object> get props => [_organizerItems];
}
