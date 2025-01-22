import 'package:fo_fe/features/organizer/all_items/tag/domain/entities/tag_user_entity.dart';
import 'package:fo_fe/features/organizer/all_items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/domain/entities/dto_entity.dart';

class Tag extends DtoEntity {
  final TagEntity tag;
  final TagUserLinkEntity tagUserLink;

  Tag({
    required this.tag,
    required this.tagUserLink,
  }) : super(
          entity: tag,
          userLink: tagUserLink,
        );

  static get empty => Tag(
        tag: TagEntity.empty(),
        tagUserLink: TagUserLinkEntity.empty(),
      );

  Tag copyWith({
    TagEntity? tag,
    TagUserLinkEntity? tagUserLink,
  }) {
    return Tag(
      tag: tag ?? this.tag,
      tagUserLink: tagUserLink ?? this.tagUserLink,
    );
  }

  @override
  List<Object?> get props => [tag, tagUserLink];
}
