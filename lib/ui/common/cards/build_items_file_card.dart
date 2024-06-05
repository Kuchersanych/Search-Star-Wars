import 'dart:io';

import 'package:flutter/material.dart';
import 'package:search_star_warriors/ui/common/cards/item_file_card.dart';
import 'package:search_star_warriors/ui/common/title_widget.dart';
import 'package:search_star_warriors/ui/theme/app_border_radius.dart';
import 'package:search_star_warriors/ui/theme/app_padding.dart';
import 'package:search_star_warriors/ui/theme/src/theme_extension.dart';

class BuildItemsFileCard extends StatelessWidget {
  /// Карточка одного файла
  const BuildItemsFileCard({
    super.key,
    required this.items,
    required this.onTap,
    required this.emptyMessage,
    this.title = '',
    this.titleWidget,
  });

  /// Массив файлов
  final List<File> items;

  /// Коллбак на нажите по карточке файла
  final ValueChanged<int> onTap;

  /// Заголовок
  final String title;

  /// Сообщение в случае пустого массива[items]
  final String emptyMessage;

  /// Дополнительный виджет в [TitleWidget]
  final Widget? titleWidget;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleWidget(
          title: title,
          widget: titleWidget,
        ),
        Visibility(
          visible: items.isNotEmpty,
          replacement: Container(
            margin: EdgeInsets.all(AppPadding.mainWidth),
            padding: EdgeInsets.all(AppPadding.mainWidth),
            decoration: BoxDecoration(
              color: context.theme.splashColor,
              borderRadius: BorderRadius.circular(AppBorderRadius.radius10)
            ),
            child: Text(emptyMessage),
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                items.length,
                (index) => ItemFileCard(
                  onTap: onTap,
                  index: index,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
