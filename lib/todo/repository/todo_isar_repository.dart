import 'dart:async';

import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_example_1/todo/repository/todo_list.dart';

import '../model/todo.dart';
import 'itodo_repository.dart';

class TodoIsarRepository extends ITodoRepository {
  late Isar isar;
  TodoIsarRepository(state) : super(state) {
    _openIsarDb();
  }

  void _openIsarDb() async {
    final dir = await getApplicationSupportDirectory();
    isar = await Isar.open(
      schemas: [TodoSchema],
      directory: dir.path,
      inspector: true,
    );

    load();
    watchQuery();
  }

  @override
  void toggleTodo(Todo todo) {
    final _todo = todo.copyWith(
        isCompleted: !todo.isCompleted,
        completedTime: !todo.isCompleted ? DateTime.now() : null);
    isar.writeTxn((isar) => isar.todos.put(_todo));
  }

  @override
  delete(Todo todo) {
    if (todo.id != null) {
      isar.writeTxn((isar) => isar.todos.delete(todo.id!));
    }
  }

  @override
  add(Todo todo) {
    isar.writeTxn((isar) async {
      todo.id = await isar.todos.put(todo);
      // queryTodos();
    });
  }

  StreamSubscription? _streamSubscription;

  void watchQuery() async {
    await _streamSubscription?.cancel();
    Stream<List<Todo>> queryStream = queryBuilder().watch();
    _streamSubscription = queryStream.listen((event) {
      state = event;
    });
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> queryBuilder() {
    // searchTodoProvider

    return isar.todos.where().sortByIsCompleted().thenByCompletedTimeDesc();
  }

  void load() {
    queryBuilder().findAll().then((value) => state = value);
  }
}
