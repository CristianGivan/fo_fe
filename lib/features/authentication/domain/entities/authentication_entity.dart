import 'package:equatable/equatable.dart';
import 'package:fo_fe/core/utils/date_time/date_time_constants.dart';

class AuthEntity extends Equatable {
  final int _id;
  final int _userId;
  final String _token;
  final String _deviceInfo; // is of format deviceName:userName
  final DateTime _createdDate;
  final DateTime _expiredDate;
  final DateTime _lastUsedDate;
  final int _usedCount;
  final int _usedCountMax;
  final bool _isActive;
  final bool _isAutoSignIn;

  AuthEntity({
    int? id,
    int? userId,
    String? token,
    String? deviceInfo,
    DateTime? createdDate,
    DateTime? expiredDate,
    DateTime? lastUsedDate,
    int? usedCount,
    int? usedCountMax,
    bool? isActive,
    bool? isAutoSignIn,
  })  : _id = id ?? 0,
        _userId = userId ?? 0,
        _token = token ?? "",
        _deviceInfo = deviceInfo ?? "",
        _createdDate = createdDate ?? INITIAL_EPOCH_DATE,
        _expiredDate = expiredDate ?? INITIAL_EPOCH_DATE,
        _lastUsedDate = lastUsedDate ?? INITIAL_EPOCH_DATE,
        _usedCount = usedCount ?? 0,
        _usedCountMax = usedCountMax ?? 100,
        _isActive = isActive ?? false,
        _isAutoSignIn = isAutoSignIn ?? false;

  factory AuthEntity.empty() {
    return AuthEntity(
      id: 0,
      userId: 0,
      token: "",
      deviceInfo: "",
      createdDate: INITIAL_EPOCH_DATE,
      expiredDate: INITIAL_EPOCH_DATE,
      lastUsedDate: INITIAL_EPOCH_DATE,
      usedCount: 0,
      usedCountMax: 0,
      isActive: false,
      isAutoSignIn: false,
    );
  }

  bool isEmpty() => this == AuthEntity.empty();

  bool isTokenExpired() =>
      isEmpty() || usedCount >= usedCountMax || expiredDate.isBefore(DateTime.now());

  int get id => _id;

  int get userId => _userId;

  String get token => _token;

  String get deviceInfo => _deviceInfo;

  DateTime get createdDate => _createdDate;

  DateTime get expiredDate => _expiredDate;

  DateTime get lastUsedDate => _lastUsedDate;

  int get usedCount => _usedCount;

  int get usedCountMax => _usedCountMax;

  bool get isActive => _isActive;

  bool get isAutoSignIn => _isAutoSignIn;

  AuthEntity copyWith({
    int? id,
    int? userId,
    String? token,
    String? deviceInfo,
    DateTime? createdDate,
    DateTime? expiredDate,
    DateTime? lastUsedDate,
    int? usedCount,
    int? usedCountMax,
    bool? isActive,
    bool? isAutoSignIn,
  }) {
    return AuthEntity(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      token: token ?? this.token,
      deviceInfo: deviceInfo ?? this.deviceInfo,
      createdDate: createdDate ?? this.createdDate,
      expiredDate: expiredDate ?? this.expiredDate,
      lastUsedDate: lastUsedDate ?? this.lastUsedDate,
      usedCount: usedCount ?? this.usedCount,
      usedCountMax: usedCountMax ?? this.usedCountMax,
      isActive: isActive ?? this.isActive,
      isAutoSignIn: isAutoSignIn ?? this.isAutoSignIn,
    );
  }

  @override
  List<Object?> get props => [
        _id,
        _userId,
        _token,
        _deviceInfo,
        _createdDate,
        _expiredDate,
        _lastUsedDate,
        _usedCount,
        _usedCountMax,
        _isActive,
        _isAutoSignIn,
      ];
}
