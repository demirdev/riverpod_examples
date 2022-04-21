import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/todo.dart';
import '../provider/providers.dart';

class AddTodoWidget extends ConsumerWidget {
  AddTodoWidget({
    Key? key,
  }) : super(key: key);

  final TextEditingController _editingController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
              child: TextFormField(
            controller: _editingController,
          )),
          ElevatedButton(
              onPressed: () {
                if (_editingController.text.isNotEmpty) {
                  ref
                      .read(todosProvider.notifier)
                      .add(Todo(_editingController.text));
                  _editingController.clear();
                }
              },
              child: Text('Add'))
        ],
      ),
    );
  }
}
