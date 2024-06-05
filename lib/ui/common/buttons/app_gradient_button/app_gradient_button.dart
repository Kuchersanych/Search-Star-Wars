library app_button;

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:search_star_warriors/library/adaptive/adaptive.dart';
import 'package:search_star_warriors/ui/common/app_ink_well.dart';
import 'package:search_star_warriors/ui/theme/app_border_radius.dart';
import 'package:search_star_warriors/ui/theme/app_durations.dart';
import 'package:search_star_warriors/ui/theme/app_size.dart';
import 'package:search_star_warriors/ui/theme/src/theme_extension.dart';

import '../../../theme/app_colors.dart';

part 'src/button_data.dart';

part 'src/state_button.dart';

part 'src/button_helper.dart';

class AppGradientButton extends StatefulWidget {
  /// Виджет кнопки с анимацией
  const AppGradientButton({
    super.key,
    required this.onTap,
    this.child = const SizedBox.shrink(),
    this.loadingText = '',
    this.stateButton = StateButton.active,
    this.colorList,
    this.width,
    this.height,
  });

  /// Дочерний виджет
  final Widget child;

  /// Цвета градиента
  final List<Color>? colorList;

  /// Тексст описания действия кнопки в состоянии загрузки [StateButton.loading]
  final String loadingText;

  /// Состояния кнопки
  final StateButton stateButton;

  /// Действие по надатию
  final VoidCallback onTap;

  /// Ширина
  final double? width;

  /// Высота
  final double? height;

  @override
  State<AppGradientButton> createState() => _AppGradientButtonState();
}

class _AppGradientButtonState extends State<AppGradientButton> with TickerProviderStateMixin {
  /// Хелпер реализации работы виджета
  late ButtonHelper buttonHelper;

  @override
  void initState() {
    super.initState();
    buttonHelper = ButtonHelper();
  }

  @override
  void didChangeDependencies() {
    buttonHelper.init(widget.colorList ?? context.theme.gradient);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return AppInkWell(
      borderRadius: BorderRadius.circular(AppBorderRadius.radius12),
      onTap: widget.onTap,
      child: ValueListenableBuilder(
        valueListenable: buttonHelper.update,
        builder: (_, state, __) {
          return AnimatedContainer(
            width: widget.width ?? double.infinity,
            height: widget.height ??  AppSize.buttonHeight.a,
            alignment: Alignment.center,
            duration: AppDuration.oneSecond,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppBorderRadius.radius12),
              gradient: LinearGradient(
                begin: state.begin,
                end: state.end,
                colors: [state.leftColor, state.rightColor],
              ),
            ),
            onEnd: () => buttonHelper.onEnd(widget.stateButton),
            child: widget.child,
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    buttonHelper.dispose();
    super.dispose();
  }
}
