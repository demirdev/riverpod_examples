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
      margin: EdgeInsets.all(10),
      child: Dismissible(
        key: Key(_todo.id.toString() + _todo.isCompleted.toString()),
        direction: DismissDirection.startToEnd,
        onDismissed: (direction) {
          // if (direction == DismissDirection.endToStart) {
          //   ref.read(todosProvider.notifier).toggleTodo(_todo);
          // } else
          //
          if (direction == DismissDirection.startToEnd) {
            ref.read(todosProvider.notifier).delete(_todo);
          }
        },
        secondaryBackground: Container(
          color: Colors.green,
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.check,
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
          ),
        ),
        background: Container(
          color: Colors.red,
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.delete,
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
          ),
        ),
        child: Container(
          padding: EdgeInsets.all(10),
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
        ),
      ),
    );
  }

  TextStyle? todoStyle() {
    return _todo.isCompleted
        ? const TextStyle(decoration: TextDecoration.lineThrough)
        : null;
  }
}
