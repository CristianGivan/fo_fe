part of '../../task_lib.dart';

class Task extends Equatable {
  int id;
  String subject;
  DateTime createdDate;
  DateTime startDate;
  DateTime endDate;
  double workingTime;
  double estimatedTime;
  double estimatedLeftTime;
  double workingProgress;
  bool status; //todo tb del
  TaskStatus taskStatus;
  User creator;
  List<User> userList;
  List<Tag> tagList;
  List<Reminder> reminderList;
  List<Work> workList;
  List<Topic> topicList;

  // todo tb del
  bool changeState() {
    status = !status;
    return status;
  }

  Task(
      this.id,
      this.subject,
      this.status, // todo tb del
      this.createdDate,
      this.startDate,
      this.endDate,
      this.workingTime,
      this.estimatedTime,
      this.estimatedLeftTime,
      this.workingProgress,
      this.taskStatus,
      this.creator,
      this.userList,
      this.tagList,
      this.reminderList,
      this.workList,
      this.topicList);

  @override
  String toString() {
    return 'Task{id: $id, subject: $subject, createdDate: $createdDate, startDate: $startDate, endDate: $endDate, workingTime: $workingTime, estimatedTime: $estimatedTime, estimatedLeftTime: $estimatedLeftTime, workingProgress: $workingProgress, status: $status, taskStatus: $taskStatus, creator: $creator, userList: $userList, tagList: $tagList, reminderList: $reminderList, workList: $workList, topicList: $topicList}';
  }

  @override
  List<Object> get props {
    return [
      id,
      subject,
      createdDate,
      startDate,
      endDate,
      workingTime,
      estimatedTime,
      estimatedLeftTime,
      workingProgress,
      status,
      creator,
      userList,
      tagList,
      reminderList,
      workList,
      topicList,
    ];
  }
}
