import 'organizer_item.dart';

class OrganizerItemsBuilder {
  final List<OrganizerItemEntity> _organizerItems;

  OrganizerItemsBuilder(this._organizerItems);

  factory OrganizerItemsBuilder.empty() => OrganizerItemsBuilder([]);

  factory OrganizerItemsBuilder.of(List<OrganizerItemEntity> organizerItems) =>
      OrganizerItemsBuilder(
          organizerItems.whereType<OrganizerItemEntity>().toList());

  void add(OrganizerItemEntity organizerItem) {
    _organizerItems.add(organizerItem);
  }

  void addAll(Iterable<OrganizerItemEntity> elements) {
    _organizerItems.addAll(elements);
  }

  void remove(OrganizerItemEntity organizerItem) {
    _organizerItems.remove(organizerItem);
  }

  void removeAt(int index) {
    _organizerItems.removeAt(index);
  }
}
