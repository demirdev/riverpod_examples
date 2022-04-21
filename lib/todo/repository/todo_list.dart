import 'package:riverpod/riverpod.dart';

import '../model/todo.dart';

class TodoRepository extends StateNotifier<List<Todo>> {
  TodoRepository(state) : super(state);

  final _completedTodos = <Todo>[];
  final _notCompletedTodos = <Todo>[];

  add(Todo todo) {
    _notCompletedTodos.add(todo);
    sortAndSetState();
  }

  void toggleTodo(Todo todo) {
    final isCompletedNewState = !todo.isCompleted;
    final _updatedTodo = todo.copyWith(
      isCompleted: isCompletedNewState,
      completedTime: isCompletedNewState ? DateTime.now() : null,
    );

    if (isCompletedNewState) {
      _notCompletedTodos.remove(todo);
      _completedTodos.add(_updatedTodo);
    } else {
      _completedTodos.remove(todo);
      _notCompletedTodos.add(_updatedTodo);
    }

    sortAndSetState();
  }

  sortAndSetState() {
    _notCompletedTodos.sort(sortByDate);
    _completedTodos.sort(sortByDate);

    final todos = [..._notCompletedTodos, ..._completedTodos];

    state = todos;
  }

  int sortByDate(a, b) {
    final _firstDate = a.completedTime ?? a.createdTime;
    final _secondDate = b.completedTime ?? b.createdTime;
    return _secondDate.millisecondsSinceEpoch -
        _firstDate.millisecondsSinceEpoch;
  }
}
