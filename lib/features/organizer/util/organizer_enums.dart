// todo
enum TaskStatus { undefined, started, working, pending, completed }

const Map<String, TaskStatus> statusMap = {
  'UNDEFINE': TaskStatus.undefined,
  'STARTED': TaskStatus.started,
  'WORKING': TaskStatus.working,
  'PENDING': TaskStatus.pending,
  'COMPLETED': TaskStatus.completed,
};
