import 'package:fo_fe/core/util/organizer/id_set.dart';

import 'organizer_item.dart';

class OrganizerItems {
  // is not final because I need to change it
  List<OrganizerItemEntity> _organizerItems;

  OrganizerItems({required List<OrganizerItemEntity> organizerItems})
      : _organizerItems = organizerItems;

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

  OrganizerItemEntity get(int index) {
    return _organizerItems[index];
  }

  int size() {
    return _organizerItems.length;
  }

  int indexOf(OrganizerItemEntity organizerItem) {
    return _organizerItems.indexOf(organizerItem);
  }

  bool isEmpty() {
    return _organizerItems.isEmpty;
  }

  bool contains(OrganizerItemEntity organizerItem) {
    return _organizerItems.contains(organizerItem);
  }

  ///bool hasOverdueTasks = organizerItemList.any((task) => task.endDate.isBefore(DateTime.now()));
  ///if (hasOverdueTasks) {
  ///  print("You have overdue tasks!");
  ///}
  bool any(bool Function(OrganizerItemEntity element) test) {
    return _organizerItems.any(test);
  }

  ///bool allTasksHaveValidPriority = organizerItemList.every((task) => task.priorityLevel >= 1 && task.priorityLevel <= 5);
  /// if (!allTasksHaveValidPriority) {
  ///   print("Some tasks have invalid priority levels!");
  /// }
  bool every(bool Function(OrganizerItemEntity element) test) =>
      _organizerItems.every(test);

  /// List<int> numbers = [1, 2, 3, 4, 5];
  /// List<int> doubledNumbers = numbers.map((int x) => x * 2).toList();
  /// doubledNumbers is now [2, 4, 6, 8, 10]
  List<R> map<R>(R Function(OrganizerItemEntity) f) {
    return _organizerItems.map(f).toList();
  }

  ///List<int> numbers = [1, 2, 3, 4, 5];
  /// List<int> sublist = numbers.sublist(1, 4);
  /// sublist is now [2, 3, 4]
  void sort([int Function(OrganizerItemEntity, OrganizerItemEntity)? compare]) {
    _organizerItems.sort(compare);
  }

  ///  List<int> numbers = [1, 2, 3, 4, 5];
  ///  List<int> evenNumbers = numbers.filter((int x) => x % 2 == 0);
  /// evenNumbers is now [2, 4]
  List<OrganizerItemEntity> where(
      bool Function(OrganizerItemEntity) predicate) {
    return _organizerItems.where(predicate).toList();
  }

  List<OrganizerItemEntity> filterByIdSet(IdSet idSet) {
    return _organizerItems
        .where((element) => idSet.contains(element.id))
        .toList();
  }
}
