import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example_1/store/model/store_categories.dart';
import 'package:riverpod_example_1/store/provider/store_providers.dart';

class StoreHomeScreen extends ConsumerWidget {
  const StoreHomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _categories = ref.watch(storeCategories);
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () {
            ref.refresh(storeCategories);
            // return ref.read(storeCategories.future);
            return Future.delayed(Duration(milliseconds: 0));
          },
          child: _categories.when(
              data: (StoreCategories categories) => ListView(
                    children: [
                      for (final cat in categories.list)
                        ListTile(title: Text(cat))
                    ],
                  ),
              error: (error, stack) => Text(error.toString()),
              loading: () => Center(child: CircularProgressIndicator())),
        ),
      ),
    );
  }
}
