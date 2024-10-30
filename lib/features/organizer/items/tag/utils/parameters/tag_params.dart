import 'package:fo_fe/features/organizer/items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class TagParams extends Equatable {
  final TagEntity tag;
  final int tagId;
  final IdSet idSet;

  TagParams({TagEntity? tag, this.tagId = 0, IdSet? idSet})
      : tag = tag ?? TagEntity.empty(),
        idSet = idSet ?? IdSet.empty();

  @override
  List<Object> get props => [tag, tagId];
}

class AddItemsToTagParams extends Equatable {
  final int tagId;
  final IdSet itemsIds;

  const AddItemsToTagParams({
    required this.tagId,
    required this.itemsIds,
  });

  @override
  List<Object> get props => [tagId, itemsIds];
}

class UpdateItemsToTagParams<T extends OrganizerItemEntity> extends Equatable {
  final int tagId;
  final OrganizerItems<T> items;
  final OrganizerItems<T> updatedItems;

  const UpdateItemsToTagParams({
    required this.tagId,
    required this.items,
    required this.updatedItems,
  });

  @override
  List<Object> get props => [tagId, items, updatedItems];
}

class FilterTagsParams extends Equatable {
  final OrganizerItems<TagEntity> originalTags;
  final OrganizerItems<TagEntity> displayedTags;
  final String criteria;

  const FilterTagsParams({
    required this.originalTags,
    required this.displayedTags,
    required this.criteria,
  });

  FilterTagsParams copyWith({
    OrganizerItems<TagEntity>? originalTags,
    OrganizerItems<TagEntity>? displayedTags,
    String? criteria,
  }) {
    return FilterTagsParams(
      originalTags: originalTags ?? this.originalTags,
      displayedTags: displayedTags ?? this.displayedTags,
      criteria: criteria ?? this.criteria,
    );
  }

  @override
  List<Object?> get props => [originalTags, displayedTags, criteria];
}

class SortTagsParams {
  final OrganizerItems<TagEntity> tags;
  final String criteria;

  SortTagsParams({required this.tags, required this.criteria});

  SortTagsParams copyWith({
    OrganizerItems<TagEntity>? tags,
    String? criteria,
  }) {
    return SortTagsParams(
      tags: tags ?? this.tags,
      criteria: criteria ?? this.criteria,
    );
  }

  List<Object> get props => [tags, criteria];
}
