import 'package:fo_fe/features/organizer/all_items/tag/domain/entities/tag_user_entity.dart';
import 'package:fo_fe/features/organizer/all_items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class TagParams extends ItemParams {
  final TagEntity tagEntity;
  final TagUserLinkEntity tagUserLinkEntity;
  final Tag tagDto;
  final OrganizerItems<Tag> tagItems;

  TagParams({
    required int id,
    TagEntity? tag,
    TagUserLinkEntity? tagUserLinkEntity,
    Tag? tagDto,
    IdSet? idSet,
    int? forUserId,
    OrganizerItems<Tag>? tagItems,
  })  : tagEntity = tag ?? TagEntity.empty(),
        tagUserLinkEntity = tagUserLinkEntity ?? TagUserLinkEntity.empty(),
        tagDto = tagDto ?? Tag(tag: TagEntity.empty(), tagUserLink: TagUserLinkEntity.empty()),
        tagItems = tagItems ?? OrganizerItems.empty(),
        super(
          id: id,
          forUserId: forUserId ?? 0,
          idSet: idSet ?? IdSet.empty(),
          itemType: ItemsTypeEnum.tag,
        );

  TagParams copyWith({
    TagEntity? tag,
    TagUserLinkEntity? tagUserLinkEntity,
    Tag? tagDto,
    int? id,
    IdSet? idSet,
    int? forUserId,
  }) {
    return TagParams(
      tag: tag ?? this.tagEntity,
      tagUserLinkEntity: tagUserLinkEntity ?? this.tagUserLinkEntity,
      tagDto: tagDto ?? this.tagDto,
      id: id ?? this.id,
      idSet: idSet ?? this.idSet,
      forUserId: forUserId ?? this.forUserId,
    );
  }

  @override
  List<Object> get props => [tagEntity, tagUserLinkEntity, tagDto, ...super.props];

  get itemReturnType => super.itemType;
}
