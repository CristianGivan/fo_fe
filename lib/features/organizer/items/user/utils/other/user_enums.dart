enum AddUserActionEnum { AddUser, SignUp }

enum UserTypeEnum { Local, Remote, Temporary, Synced }

enum UserStatus { Pending, Accepted, Rejected, Blocked }

const Map<String, AddUserActionEnum> addUserActionMap = {
  'ADD_USER': AddUserActionEnum.AddUser,
  'SIGN_UP': AddUserActionEnum.SignUp,
};

const Map<AddUserActionEnum, String> addUserActionMapToString = {
  AddUserActionEnum.AddUser: 'ADD_USER',
  AddUserActionEnum.SignUp: 'SIGN_UP',
};

const Map<String, UserTypeEnum> userTypeMap = {
  'LOCAL': UserTypeEnum.Local,
  'REMOTE': UserTypeEnum.Remote,
  'TEMPORARY': UserTypeEnum.Temporary,
  'SYNCED': UserTypeEnum.Synced,
};

const Map<UserTypeEnum, String> userTypeMapToString = {
  UserTypeEnum.Local: 'LOCAL',
  UserTypeEnum.Remote: 'REMOTE',
  UserTypeEnum.Temporary: 'TEMPORARY',
  UserTypeEnum.Synced: 'SYNCED',
};

const Map<String, UserStatus> userStatusMap = {
  'PENDING': UserStatus.Pending,
  'ACCEPTED': UserStatus.Accepted,
  'REJECTED': UserStatus.Rejected,
  'BLOCKED': UserStatus.Blocked,
};

const Map<UserStatus, String> userStatusMapToString = {
  UserStatus.Pending: 'PENDING',
  UserStatus.Accepted: 'ACCEPTED',
  UserStatus.Rejected: 'REJECTED',
  UserStatus.Blocked: 'BLOCKED',
};
