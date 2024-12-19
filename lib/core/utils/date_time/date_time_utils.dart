class DateTimeUtils implements DateTime {
  const DateTimeUtils();

  @override
  int get year => 1970;

  @override
  int get month => 1;

  @override
  int get day => 1;

  @override
  int get hour => 0;

  @override
  int get minute => 0;

  @override
  int get second => 0;

  @override
  int get millisecond => 0;

  @override
  int get microsecond => 0;

  @override
  int get millisecondsSinceEpoch => 0;

  @override
  int get microsecondsSinceEpoch => 0;

  @override
  int get weekday => 4; // Thursday
  @override
  Duration get timeZoneOffset => Duration.zero;

  @override
  String get timeZoneName => 'UTC';

  @override
  bool get isUtc => true;

  @override
  DateTime add(Duration duration) {
    // TODO: implement add
    throw UnimplementedError();
  }

  @override
  int compareTo(DateTime other) {
    // TODO: implement compareTo
    throw UnimplementedError();
  }

  @override
  Duration difference(DateTime other) {
    // TODO: implement difference
    throw UnimplementedError();
  }

  @override
  bool isAfter(DateTime other) {
    // TODO: implement isAfter
    throw UnimplementedError();
  }

  @override
  bool isAtSameMomentAs(DateTime other) {
    // TODO: implement isAtSameMomentAs
    throw UnimplementedError();
  }

  @override
  bool isBefore(DateTime other) {
    // TODO: implement isBefore
    throw UnimplementedError();
  }

  @override
  DateTime subtract(Duration duration) {
    // TODO: implement subtract
    throw UnimplementedError();
  }

  @override
  String toIso8601String() {
    // TODO: implement toIso8601String
    throw UnimplementedError();
  }

  @override
  DateTime toLocal() {
    // TODO: implement toLocal
    throw UnimplementedError();
  }

  @override
  DateTime toUtc() {
    // TODO: implement toUtc
    throw UnimplementedError();
  }
}
