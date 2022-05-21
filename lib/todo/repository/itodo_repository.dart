import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/todo.dart';

abstract class ITodoRepository extends StateNotifier<List<Todo>> {
  ITodoRepository(List<Todo> state) : super(state);

  add(Todo todo);
  delete(Todo todo);
  toggleTodo(Todo todo);
}
