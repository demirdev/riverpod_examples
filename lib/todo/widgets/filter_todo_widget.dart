import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/enum/filter_type_enum.dart';
import '../provider/providers.dart';

class FilterTodoWidget extends ConsumerWidget {
  const FilterTodoWidget({
    Key? key,
  }) : super(key: key);

  final _filterValues = FilterType.values;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _selectedFilter = ref.watch(filterTypeProvider);

    final _optionList = List.filled(FilterType.values.length, false);
    _optionList[_filterValues.indexOf(_selectedFilter)] = true;

    return ToggleButtons(
      children: FilterType.values.map((e) => Icon(getIcon(e))).toList(),
      isSelected: _optionList,
      onPressed: (int index) =>
          ref.read(filterTypeProvider.notifier).state = _filterValues[index],
    );
  }

  IconData? getIcon(FilterType e) {
    switch (e) {
      case FilterType.none:
        return Icons.list;
      case FilterType.completed:
        return Icons.check;
    }
  }
}
