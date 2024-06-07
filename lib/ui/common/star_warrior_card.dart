import 'package:flutter/material.dart';
import 'package:search_star_warriors/domain/entity/star_warrior.dart';
import 'package:search_star_warriors/library/adaptive/adaptive.dart';
import 'package:search_star_warriors/ui/common/app_card.dart';
import 'package:search_star_warriors/ui/common/buttons/app_button.dart';
import 'package:search_star_warriors/ui/theme/src/theme_extension.dart';
import 'package:search_star_warriors/util/extensions/context_extensions.dart';

class StarWarriorCard extends StatelessWidget {
  /// Карточка героя.
  const StarWarriorCard({
    required this.addWarrior,
    required this.warrior,
    this.isShowButtonSave = true,
    super.key,
  });

  /// Добавление в избранное.
  final VoidCallback addWarrior;

  /// Герой.
  final StarWarrior warrior;

  /// Флаг показа кнопки.
  final bool isShowButtonSave;

  @override
  Widget build(BuildContext context) {
    final s = context.s;
    return AppCard(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.a, vertical: 10.a),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: 15.a),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    warrior.name,
                    maxLines: 2,
                    style: context.mBlack18(),
                  ),
                  SizedBox(height: 10.a),
                  Text('${s.gender} ${warrior.gender}', style: context.mBlack14()),
                  SizedBox(height: 10.a),
                  Text('${s.starships} ${warrior.starships.length} ', style: context.mBlue14()),
                  SizedBox(height: 10.a),
                  Visibility(
                    visible: isShowButtonSave,
                    child: AppButton(
                      text: s.save,
                      onTap: warrior.isFavorite ? (){} : addWarrior,
                      color:
                          warrior.isFavorite ? context.theme.dividerColor : context.theme.focusedBorderColor,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
