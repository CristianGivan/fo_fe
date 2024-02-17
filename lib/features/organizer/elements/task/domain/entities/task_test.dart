part of '../../task_lib.dart';

class TaskTest extends Equatable {
  int id;
  String subject;


  TaskTest(
    this.id,
    this.subject,
  );



  static TaskTest empty() {
    return TaskTest(
      0,
      "",
    );
  }

  @override
  String toString() {
    return 'TaskTest(id: $id, subject: $subject, )';
  }

  @override
  List<Object> get props {
    return [
      id,
      subject,
    ];
  }

  TaskTest copyWith({
    int? id,
    String? subject,

  }) {
    return TaskTest(
      id ?? this.id,
      subject ?? this.subject,

    );
  }
    factory TaskTest.fromJson(Map<String, dynamic> json) {
      return TaskTest(
        json['taskId'],
        json['task'],
      );
    }
  }


