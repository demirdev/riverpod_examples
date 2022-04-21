import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/configuration.dart';

final configProvider = FutureProvider<Configuration>((ref) async {
  await Future.delayed(Duration(seconds: 2));
  final content = jsonDecode(await rootBundle.loadString('assets/config.json'));
  return Configuration.fromJson(content);
});
