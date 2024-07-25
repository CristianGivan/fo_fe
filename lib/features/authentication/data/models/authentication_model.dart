import 'package:equatable/equatable.dart';
import 'package:fo_fe/features/authentication/config/authentication_exports.dart';

class AuthenticationModel extends AuthenticationEntity with EquatableMixin {
  AuthenticationModel({
    int? id,
    int? userId,
    String? token,
    String? deviceInfo,
    DateTime? createdDate,
    DateTime? expiredDate,
    DateTime? lastUsedDate,
    int? refreshCount,
    bool? isActive,
  }) : super(
          id: id,
          userId: userId,
          token: token,
          deviceInfo: deviceInfo,
          createdDate: createdDate,
          expiredDate: expiredDate,
          lastUsedDate: lastUsedDate,
          refreshCount: refreshCount,
          isActive: isActive,
        );

  factory AuthenticationModel.empty() => AuthenticationModel(
        id: 0,
        userId: 0,
        token: "",
        deviceInfo: "",
        createdDate: DateTime.now(),
        expiredDate: DateTime.now(),
        lastUsedDate: DateTime.now(),
        refreshCount: 0,
        isActive: false,
      );

  @override
  List<Object?> get props => [
        id,
        userId,
        token,
        deviceInfo,
        createdDate,
        expiredDate,
        lastUsedDate,
        refreshCount,
        isActive,
      ];

  AuthenticationModel copyWith(
      {int? id,
      int? userId,
      String? token,
      String? deviceInfo,
      DateTime? createdDate,
      DateTime? expiredDate,
      DateTime? lastUsedDate,
      int? refreshCount,
      bool? isActive}) {
    return AuthenticationModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      token: token ?? this.token,
      deviceInfo: deviceInfo ?? this.deviceInfo,
      createdDate: createdDate ?? this.createdDate,
      expiredDate: expiredDate ?? this.expiredDate,
      lastUsedDate: lastUsedDate ?? this.lastUsedDate,
      refreshCount: refreshCount ?? this.refreshCount,
      isActive: isActive ?? this.isActive,
    );
  }
}
