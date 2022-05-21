import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example_1/todo/repository/todo_isar_repository.dart';

import '../model/enum/filter_type_enum.dart';
import '../model/todo.dart';
import '../repository/itodo_repository.dart';

final searchTodoProvider = StateProvider<String>((ref) {
  return '';
});

final filterTypeProvider = StateProvider<FilterType>((ref) {
  return FilterType.none;
});

final todosProvider = StateNotifierProvider<ITodoRepository, List<Todo>>((ref) {
  // return TodoRepository(<Todo>[]);
  return TodoIsarRepository(<Todo>[]);
});

final filteredTodoListProvider = Provider((ref) {
  final FilterType filter = ref.watch(filterTypeProvider);
  final searchText = ref.watch(searchTodoProvider).toLowerCase();
  final List<Todo> todos = searchText.isEmpty
      ? ref.watch(todosProvider)
      : ref
          .watch(todosProvider)
          .where((element) => element.text.toLowerCase().contains(searchText))
          .toList();

  switch (filter) {
    case FilterType.completed:
      return todos.where((element) => element.isCompleted).toList();
    case FilterType.none:
      return todos;
  }
});
