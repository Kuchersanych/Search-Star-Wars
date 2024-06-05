part of '../status_bar_manager.dart';

/// Текущая тема
enum CurrentTheme { light, dark }

/// Типы обработки взаимодействия с системными эллементами
/// [safeArea] - весь проект будет обернут в [SafeArea]
/// [systemPadding] - для всего проета будут установлены отступы сверху и снизу [SafeArea]
enum StatusBar { safeArea, systemPadding }