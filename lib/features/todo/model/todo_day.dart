class TodoDay {
  TodoDay({required this.name, required this.date, List<TodoTask>? tasks})
    : tasks = tasks ?? [];

  final String name;
  final DateTime date;
  final List<TodoTask> tasks;
}

class TodoTask {
  TodoTask({required this.title, this.isDone = false});

  final String title;
  bool isDone;
}
