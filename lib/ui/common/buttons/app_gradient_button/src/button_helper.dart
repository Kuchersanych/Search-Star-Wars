part of '../app_gradient_button.dart';

/// Обработка данных виджета [AppGradientButton]
class ButtonHelper {

  late final ValueNotifier<AppButtonData> update;

  /// Остановлена ли анимация
  bool? isAnimationStop;

  /// Действие при инициализации [AppGradientButton]
  void init(List<Color> colorList ) {
    var appData = AppButtonData(
      colorList: colorList,
      leftColor: AppColorsLight.orange,
      rightColor: AppColorsLight.red,
      index: 0,
    );
    update = ValueNotifier(appData);

    Timer(
      const Duration(microseconds: 0),
          () {
        update.value = update.value.copyWith(
          leftColor: update.value.colorList.last,
        );
      },
    );
  }

  /// Проверка, нужно ли запускать анимацию
  void checkStart(StateButton stateButton) {
    if (stateButton == StateButton.loading && isAnimationStop == true) {
      update.value = update.value.copyWith(
        index: update.value.index + 1,
        leftColor: update.value.colorList[update.value.index % update.value.colorList.length],
        rightColor: update.value.colorList[(update.value.index + 1) % update.value.colorList.length],
      );
      update.value = update.value;
    }
  }

  /// Действие по оконцинию анимации
  void onEnd(StateButton stateButton) {
    if (stateButton != StateButton.loading) {
      isAnimationStop = true;
      update.value = update.value.copyWith(
        leftColor: AppColorsLight.orange,
        rightColor: AppColorsLight.red,
        index: 0,
      );
    } else {
      update.value = update.value.copyWith(
        index: update.value.index + 1,
        leftColor: update.value.colorList[update.value.index % update.value.colorList.length],
        rightColor: update.value.colorList[(update.value.index + 1) % update.value.colorList.length],
      );
    }
  }


  void dispose() {
    update.dispose();
  }
}
