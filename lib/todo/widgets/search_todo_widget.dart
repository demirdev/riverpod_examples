import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../main.dart';
import '../model/todo.dart';
import '../provider/providers.dart';

class SearchTodoWidget extends ConsumerWidget {
  SearchTodoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
              child: TextFormField(
            decoration: InputDecoration(hintText: 'Search'),
            onChanged: (query) {
              ref.read(searchTodoProvider.notifier).state = query;
            },
          )),
        ],
      ),
    );
  }
}
