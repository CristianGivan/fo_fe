class DeviceInfo {
  final String _device;
  final String _deviceUser;

  String get device => _device;

  String getDeviceInfo() {
    return "$device:$deviceUser";
  }

  String get deviceUser => _deviceUser;

  const DeviceInfo({
    String? device,
    String? deviceUser,
  })  : _device = device ?? "",
        _deviceUser = deviceUser ?? "";
}
