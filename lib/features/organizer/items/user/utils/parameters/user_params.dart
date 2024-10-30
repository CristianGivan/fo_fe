import 'package:fo_fe/features/organizer/items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class UserParams extends Equatable {
  final UserEntity user;
  final int userId;
  final IdSet idSet;

  UserParams({UserEntity? user, this.userId = 0, IdSet? idSet})
      : user = user ?? UserEntity.empty(),
        idSet = idSet ?? IdSet.empty();

  @override
  List<Object> get props => [user, userId];
}

class AddItemsToUserParams extends Equatable {
  final int userId;
  final IdSet itemsIds;

  const AddItemsToUserParams({
    required this.userId,
    required this.itemsIds,
  });

  @override
  List<Object> get props => [userId, itemsIds];
}

class UpdateItemsToUserParams<T extends OrganizerItemEntity> extends Equatable {
  final int userId;
  final OrganizerItems<T> items;
  final OrganizerItems<T> updatedItems;

  const UpdateItemsToUserParams({
    required this.userId,
    required this.items,
    required this.updatedItems,
  });

  @override
  List<Object> get props => [userId, items, updatedItems];
}

class FilterUsersParams extends Equatable {
  final OrganizerItems<UserEntity> originalUsers;
  final OrganizerItems<UserEntity> displayedUsers;
  final String criteria;

  const FilterUsersParams({
    required this.originalUsers,
    required this.displayedUsers,
    required this.criteria,
  });

  FilterUsersParams copyWith({
    OrganizerItems<UserEntity>? originalUsers,
    OrganizerItems<UserEntity>? displayedUsers,
    String? criteria,
  }) {
    return FilterUsersParams(
      originalUsers: originalUsers ?? this.originalUsers,
      displayedUsers: displayedUsers ?? this.displayedUsers,
      criteria: criteria ?? this.criteria,
    );
  }

  @override
  List<Object?> get props => [originalUsers, displayedUsers, criteria];
}

class SortUsersParams {
  final OrganizerItems<UserEntity> users;
  final String criteria;

  SortUsersParams({required this.users, required this.criteria});

  SortUsersParams copyWith({
    OrganizerItems<UserEntity>? users,
    String? criteria,
  }) {
    return SortUsersParams(
      users: users ?? this.users,
      criteria: criteria ?? this.criteria,
    );
  }

  List<Object> get props => [users, criteria];
}
