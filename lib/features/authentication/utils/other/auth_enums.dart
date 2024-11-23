enum AuthOperation { logIn, logInAuto, logOut, logSwitch }

const Map<String, AuthOperation> authOperationMap = {
  'LOG_IN': AuthOperation.logIn,
  'LOG_IN_AUTO': AuthOperation.logInAuto,
  'LOG_OUT': AuthOperation.logOut,
  'LOG_SWITCH': AuthOperation.logSwitch,
};

const Map<AuthOperation, String> authOperationMapToString = {
  AuthOperation.logIn: 'LOG_IN',
  AuthOperation.logInAuto: 'LOG_IN_AUTO',
  AuthOperation.logOut: 'LOG_OUT',
  AuthOperation.logSwitch: 'LOG_SWITCH',
};
