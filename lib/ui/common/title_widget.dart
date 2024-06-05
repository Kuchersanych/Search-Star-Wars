
import 'package:flutter/material.dart';
import 'package:search_star_warriors/ui/theme/app_padding.dart';
import 'package:search_star_warriors/ui/theme/src/theme_extension.dart';

class TitleWidget extends StatelessWidget {
  /// Виджет описания назначения виджета
  const TitleWidget({
    super.key,
    required this.title,
    this.widget,
  });

  /// Заголовок
  final String title;

  /// Дополнительный виджет
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Visibility(
          visible: title.isNotEmpty,
          child: Padding(
            padding: EdgeInsets.only(left: AppPadding.mainWidth),
            child: Text(
              title,
              style: context.blackWhite24w500(),
            ),
          ),
        ),
        if (widget != null) widget!
      ],
    );
  }
}