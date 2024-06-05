/// Дополнительные настройки приложения в режиме отладки.
class DebugOptions {
  /// Показать наложение производительности.
  final bool showPerformanceOverlay;

  /// Показать сетку материалов.
  final bool debugShowMaterialGrid;

  /// Кэш растровых изображений шахматной доски.
  final bool checkerboardRasterCacheImages;

  /// Закадровые слои шахматной доски.
  final bool checkerboardOffscreenLayers;

  /// Показать отладчик семантики.
  final bool showSemanticsDebugger;

  /// Отладка показывает баннер проверенного режима.
  final bool debugShowCheckedModeBanner;

  /// Create an instance [DebugOptions].
  DebugOptions({
    this.showPerformanceOverlay = false,
    this.debugShowMaterialGrid = false,
    this.checkerboardRasterCacheImages = false,
    this.checkerboardOffscreenLayers = false,
    this.showSemanticsDebugger = false,
    this.debugShowCheckedModeBanner = false,
  });

  /// Создайте экземпляр [DebugOptions] с измененными параметрами.
  DebugOptions copyWith({
    bool? showPerformanceOverlay,
    bool? debugShowMaterialGrid,
    bool? checkerboardRasterCacheImages,
    bool? checkerboardOffscreenLayers,
    bool? showSemanticsDebugger,
    bool? debugShowCheckedModeBanner,
  }) =>
      DebugOptions(
        showPerformanceOverlay:
            showPerformanceOverlay ?? this.showPerformanceOverlay,
        checkerboardOffscreenLayers:
            checkerboardOffscreenLayers ?? this.checkerboardOffscreenLayers,
        checkerboardRasterCacheImages:
            checkerboardRasterCacheImages ?? this.checkerboardRasterCacheImages,
        debugShowCheckedModeBanner:
            debugShowCheckedModeBanner ?? this.debugShowCheckedModeBanner,
        debugShowMaterialGrid:
            debugShowMaterialGrid ?? this.debugShowMaterialGrid,
        showSemanticsDebugger:
            showSemanticsDebugger ?? this.showSemanticsDebugger,
      );
}
