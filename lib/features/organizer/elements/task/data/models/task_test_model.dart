part of '../../task_lib.dart';

class TaskTestModel extends TaskTest {
  TaskTestModel(
    super.id,
    super.subject,
  );

  static TaskTestModel empty() {
    return TaskTestModel(
      0,
      "",
    );
  }

  factory TaskTestModel.fromJson(Map<String, dynamic> json) {
    return TaskTestModel(
      json['taskId'],
      json['task'],
    );
  }
  @override
  TaskTestModel copyWith({
    int? id,
    String? subject,

  }) {
    return TaskTestModel(
      id ?? this.id,
      subject ?? this.subject,

    );
  }

  @override
  List<Object> get props {
    return [
      id,
      subject,

    ];
  }
}
