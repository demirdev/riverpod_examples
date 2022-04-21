import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_example_1/store/model/store_categories.dart';
import 'package:riverpod_example_1/store/provider/config_provider.dart';

final storeCategories = FutureProvider((ref) async {
  final _config = await ref.watch(configProvider.future);

  final _response = await http.get(Uri.parse(_config.baseURL));

  return StoreCategories.fromJson(jsonDecode(_response.body));
});
