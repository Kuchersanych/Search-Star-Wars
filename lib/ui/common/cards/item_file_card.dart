
import 'package:flutter/material.dart';
import 'package:search_star_warriors/library/adaptive/adaptive.dart';
import 'package:search_star_warriors/ui/common/app_ink_well.dart';
import 'package:search_star_warriors/ui/resources/assets_path.dart';
import 'package:search_star_warriors/ui/theme/app_border_radius.dart';
import 'package:search_star_warriors/ui/theme/app_padding.dart';
import 'package:search_star_warriors/ui/theme/src/theme_extension.dart';

class ItemFileCard extends StatelessWidget {
  /// Карточка файла
  const ItemFileCard({
    super.key,
    required this.onTap,
    required this.index,
  });

  /// Коллбак на нажите по карточке файла
  final ValueChanged<int> onTap;

  /// Текущий index
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: index == 0 ? AppPadding.mainWidth : 0,
        right: index + 1 == 10 ? AppPadding.mainWidth : 10.a,
        bottom: 10.a,
        top: 10.a,
      ),
      child: AppInkWell(
        borderRadius: BorderRadius.circular(AppBorderRadius.radius10),
        onTap: () => onTap(0),
        child: Container(
          height: 150.a,
          width: 110.a,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppBorderRadius.radius10),
            boxShadow: [
              BoxShadow(
                color: context.theme.borderColor.withOpacity(0.2),
                blurRadius: 1,
                spreadRadius: 3,
                offset: const Offset(0, 0),
              ),
            ],
            image: const DecorationImage(
              image: AssetImage(AssetsPath.logo),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}