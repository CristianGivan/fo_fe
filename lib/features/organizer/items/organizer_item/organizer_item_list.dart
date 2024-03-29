import 'package:fo_fe/core/util/organizer/id_set.dart';

import 'organizer_item.dart';

class OrganizerItems {
  // todo !!! should return list of OrganizerItems or an OrganizerItem?
  // todo !!!organizerItems should be private?
  final List<OrganizerItemEntity> organizerItems;

  OrganizerItems({required this.organizerItems});

  void add(OrganizerItemEntity organizerItem) {
    organizerItems.add(organizerItem);
  }

  void addAll(Iterable<OrganizerItemEntity> elements) {
    organizerItems.addAll(elements);
  }

  void remove(OrganizerItemEntity organizerItem) {
    organizerItems.remove(organizerItem);
  }

  void removeAt(int index) {
    organizerItems.removeAt(index);
  }

  void clear() {
    organizerItems.clear();
  }

  OrganizerItemEntity get(int index) {
    return organizerItems[index];
  }

  int size() {
    return organizerItems.length;
  }

  int indexOf(OrganizerItemEntity organizerItem) {
    return organizerItems.indexOf(organizerItem);
  }

  bool contains(OrganizerItemEntity organizerItem) {
    return organizerItems.contains(organizerItem);
  }

  ///bool hasOverdueTasks = organizerItemList.any((task) => task.endDate.isBefore(DateTime.now()));
  ///if (hasOverdueTasks) {
  ///  print("You have overdue tasks!");
  ///}
  bool any(bool Function(OrganizerItemEntity element) test) {
    return organizerItems.any(test);
  }

  ///bool allTasksHaveValidPriority = organizerItemList.every((task) => task.priorityLevel >= 1 && task.priorityLevel <= 5);
  /// if (!allTasksHaveValidPriority) {
  ///   print("Some tasks have invalid priority levels!");
  /// }
  bool every(bool Function(OrganizerItemEntity element) test) =>
      organizerItems.every(test);

  /// List<int> numbers = [1, 2, 3, 4, 5];
  /// List<int> doubledNumbers = numbers.map((int x) => x * 2).toList();
  /// doubledNumbers is now [2, 4, 6, 8, 10]
  List<R> map<R>(R Function(OrganizerItemEntity) f) {
    return organizerItems.map(f).toList();
  }

  ///List<int> numbers = [1, 2, 3, 4, 5];
  /// List<int> sublist = numbers.sublist(1, 4);
  /// sublist is now [2, 3, 4]
  void sort([int Function(OrganizerItemEntity, OrganizerItemEntity)? compare]) {
    organizerItems.sort(compare);
  }

  ///  List<int> numbers = [1, 2, 3, 4, 5];
  ///  List<int> evenNumbers = numbers.filter((int x) => x % 2 == 0);
  /// evenNumbers is now [2, 4]
  List<OrganizerItemEntity> where(
      bool Function(OrganizerItemEntity) predicate) {
    return organizerItems.where(predicate).toList();
  }

  List<OrganizerItemEntity> filterByIdSet(IdSet idSet) {
    return organizerItems.where((element) => idSet.any(element.id)).toList();
  }
//todo filter by
}
