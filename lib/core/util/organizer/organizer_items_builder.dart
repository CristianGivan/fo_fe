part of 'core_util_organizer.dart';

class OrganizerItemsBuilder extends Equatable {
  final List<OrganizerItemEntity> _organizerItems;

  OrganizerItemsBuilder._(this._organizerItems);

  factory OrganizerItemsBuilder.empty() => OrganizerItemsBuilder._([]);

  factory OrganizerItemsBuilder.of(List<OrganizerItemEntity> organizerItems) =>
      OrganizerItemsBuilder._(
          organizerItems.whereType<OrganizerItemEntity>().toList());

  OrganizerItemsBuilder add(OrganizerItemEntity organizerItem) {
    _organizerItems.add(organizerItem);
    return this;
  }

  OrganizerItemsBuilder addAll(Iterable<OrganizerItemEntity> elements) {
    _organizerItems.addAll(elements);
    return this;
  }

  OrganizerItemsBuilder remove(OrganizerItemEntity organizerItem) {
    _organizerItems.remove(organizerItem);
    return this;
  }

  OrganizerItemsBuilder removeAt(int index) {
    if (_organizerItems.isEmpty) {
      throw StateError('Cannot remove item from an empty list');
    }
    if (index < 0 || index >= _organizerItems.length) {
      throw RangeError.index(index, _organizerItems, 'Index out of range');
    }
    _organizerItems.removeAt(index);
    return this;
  }

  OrganizerItems build() => OrganizerItems.of(_organizerItems);

  @override
  List<Object> get props => [_organizerItems];
}
