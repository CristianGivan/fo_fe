import 'package:fo_fe/core/utils/exports/core_utils_exports.dart';
import 'package:fo_fe/features/organizer/all_items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class UserEntity extends OrganizerItemEntity {
  final String name;
  final String email;
  final String password;
  final String hashedPassword;
  final UserTypeEnum userType;

  UserEntity({
    required this.name,
    String? email,
    String? password,
    String? hashedPassword,
    DateTime? createdDate,
    UserTypeEnum? userType,
    int? id,
    int? creatorId,
    int? remoteId,
    DateTime? lastUpdate,
    DateTime? lastViewedDate,
    int? remoteViews,
    int? views,
    String? checksum,
  })  : email = email ?? "",
        password = password ?? "",
        hashedPassword =
            hashedPassword ?? (password == "" ? "" : HashingService.hashPassword(password ?? "")),
        userType = userType ?? UserTypeEnum.Temporary,
        super(
          subject: name,
          id: id ?? 0,
          creatorId: creatorId ?? 0,
          remoteId: remoteId ?? 0,
          createdDate: createdDate ?? INITIAL_EPOCH_DATE,
          lastUpdate: lastUpdate ?? INITIAL_EPOCH_DATE,
          lastViewedDate: lastViewedDate ?? INITIAL_EPOCH_DATE,
          remoteViews: remoteViews ?? 0,
          views: views ?? 0,
          checksum: checksum ?? '',
        );

  static final UserEntity _emptyInstance = UserEntity(name: "", email: "", password: "");

  factory UserEntity.empty() => _emptyInstance;

  @override
  bool get isEmpty => this == _emptyInstance;

  UserEntity copyWith({
    int? id,
    String? name,
    String? email,
    String? password,
    DateTime? createdDate,
    UserTypeEnum? userType,
    int? creatorId,
    int? remoteId,
    DateTime? lastUpdate,
    DateTime? lastViewedDate,
    int? remoteViews,
    int? views,
    String? checksum,
  }) {
    return UserEntity(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      createdDate: createdDate ?? this.createdDate,
      userType: userType ?? this.userType,
      id: id ?? this.id,
      creatorId: creatorId ?? this.creatorId,
      remoteId: remoteId ?? this.remoteId,
      lastUpdate: lastUpdate ?? this.lastUpdate,
      lastViewedDate: lastViewedDate ?? this.lastViewedDate,
      remoteViews: remoteViews ?? this.remoteViews,
      views: views ?? this.views,
      checksum: checksum ?? this.checksum,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        userType,
        hashedPassword,
        // Fields from OrganizerItemEntity
        subject,
        creatorId,
        createdDate,
        lastUpdate,
        lastViewedDate,
        remoteViews,
        views,
        checksum,
      ];

  @override
  String toString() {
    return 'UserEntity{id: $id, name: $name, email: $email, userType: $userType}';
  }
}
