import 'package:fo_fe/features/organizer/all_items/tag/domain/entities/tag_user_entity.dart';
import 'package:fo_fe/features/organizer/all_items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class TagParams extends ItemParams {
  final TagEntity tagEntity;
  final TagUserLinkEntity tagUserLinkEntity;
  final TagDto tag;
  final OrganizerItems<TagDto> tagItems;

  TagParams({
    required int id,
    TagEntity? tagEntity,
    TagUserLinkEntity? tagUserLinkEntity,
    TagDto? tag,
    IdSet? idSet,
    int? forUserId,
    OrganizerItems<TagDto>? tagItems,
  })  : tagEntity = tagEntity ?? TagEntity.empty(),
        tagUserLinkEntity = tagUserLinkEntity ?? TagUserLinkEntity.empty(),
        tag = tag ?? TagDto.empty,
        tagItems = tagItems ?? OrganizerItems.empty(),
        super(
          id: id,
          forUserId: forUserId ?? 0,
          idSet: idSet ?? IdSet.empty(),
          itemType: ItemsTypeEnum.tag,
        );

  TagParams copyWith({
    TagEntity? tagEntity,
    TagUserLinkEntity? tagUserLinkEntity,
    TagDto? tagDto,
    int? id,
    IdSet? idSet,
    int? forUserId,
  }) {
    return TagParams(
      tagEntity: tagEntity ?? this.tagEntity,
      tagUserLinkEntity: tagUserLinkEntity ?? this.tagUserLinkEntity,
      tag: tagDto ?? this.tag,
      id: id ?? this.id,
      idSet: idSet ?? this.idSet,
      forUserId: forUserId ?? this.forUserId,
    );
  }

  @override
  List<Object> get props => [tagEntity, tagUserLinkEntity, tag, ...super.props];

  get itemReturnType => super.itemType;
}
