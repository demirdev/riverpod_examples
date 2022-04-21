import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'provider/providers.dart';
import 'widgets/add_todo_widget.dart';
import 'widgets/filter_todo_widget.dart';
import 'widgets/search_todo_widget.dart';
import 'widgets/todo_list_item.dart';

class TodoHomeScreen extends ConsumerWidget {
  const TodoHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _filteredTodos = ref.watch(filteredTodoListProvider);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AddTodoWidget(),
            FilterTodoWidget(),
            SearchTodoWidget(),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  final _todo = _filteredTodos.elementAt(index);
                  return TodoListItem(todo: _todo);
                },
                itemCount: _filteredTodos.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
