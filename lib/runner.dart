import 'package:search_star_warriors/di/app_factory.dart';
import 'package:flutter/material.dart';

/// Запуск приложения
void run() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(makeAppFactory.makeApp());
}
