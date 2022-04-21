import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/todo.dart';
import '../provider/providers.dart';

class TodoListItem extends ConsumerWidget {
  const TodoListItem({
    Key? key,
    required Todo todo,
  })  : _todo = todo,
        super(key: key);

  final Todo _todo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xFFF2F2F2),
      ),
      child: CheckboxListTile(
        value: _todo.isCompleted,
        title: Text(
          _todo.text,
          style: todoStyle(),
        ),
        onChanged: (bool? value) {
          if (value is bool) {
            ref.read(todosProvider.notifier).toggleTodo(_todo);
          }
        },
      ),
    );
  }

  TextStyle? todoStyle() {
    return _todo.isCompleted
        ? const TextStyle(decoration: TextDecoration.lineThrough)
        : null;
  }
}
