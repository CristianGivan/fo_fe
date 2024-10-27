// todo
enum ItemsType { tag, reminder }

enum TaskStatus { undefined, started, working, pending, completed }

const Map<String, TaskStatus> taskStatusMap = {
  'UNDEFINE': TaskStatus.undefined,
  'STARTED': TaskStatus.started,
  'WORKING': TaskStatus.working,
  'PENDING': TaskStatus.pending,
  'COMPLETED': TaskStatus.completed,
};
const Map<TaskStatus, String> taskStatusToStringMap = {
  TaskStatus.undefined: 'UNDEFINE',
  TaskStatus.started: 'STARTED',
  TaskStatus.working: 'WORKING',
  TaskStatus.pending: 'PENDING',
  TaskStatus.completed: 'COMPLETED',
};
