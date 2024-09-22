import 'package:equatable/equatable.dart';
import 'package:fo_fe/core/utils/date_time/date_time_constants.dart';

class AuthenticationEntity extends Equatable {
  final int _id;
  final int _userId;
  final String _token;
  final String _deviceInfo; // is of format deviceName:userName
  final DateTime _createdDate;
  final DateTime _expiredDate;
  final DateTime _lastUsedDate;
  final int _refreshCount;
  final bool _isActive;

  AuthenticationEntity({
    int? id,
    int? userId,
    String? token,
    String? deviceInfo,
    DateTime? createdDate,
    DateTime? expiredDate,
    DateTime? lastUsedDate,
    int? refreshCount,
    bool? isActive,
  })  : _id = id ?? 0,
        _userId = userId ?? 0,
        _token = token ?? "",
        _deviceInfo = deviceInfo ?? "",
        _createdDate = createdDate ?? INITIAL_EPOCH_DATE,
        _expiredDate = expiredDate ?? INITIAL_EPOCH_DATE,
        _lastUsedDate = lastUsedDate ?? INITIAL_EPOCH_DATE,
        _refreshCount = refreshCount ?? 0,
        _isActive = isActive ?? false;

  int get id => _id;

  int get userId => _userId;

  String get token => _token;

  String get deviceInfo => _deviceInfo;

  DateTime get createdDate => _createdDate;

  DateTime get expiredDate => _expiredDate;

  DateTime get lastUsedDate => _lastUsedDate;

  int get refreshCount => _refreshCount;

  bool get isActive => _isActive;

  AuthenticationEntity copyWith({
    int? id,
    int? userId,
    String? token,
    String? deviceInfo,
    DateTime? createdDate,
    DateTime? expiredDate,
    DateTime? lastUsedDate,
    int? refreshCount,
    bool? isActive,
  }) {
    return AuthenticationEntity(
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
}
