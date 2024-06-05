import 'package:flutter/material.dart';
import 'package:search_star_warriors/library/adaptive/adaptive.dart';
import 'package:search_star_warriors/ui/common/app_card.dart';
import 'package:search_star_warriors/ui/common/buttons/app_button.dart';
import 'package:search_star_warriors/ui/theme/src/theme_extension.dart';

class StarWarriorCard extends StatelessWidget {
  /// Карточка фильма.
  const StarWarriorCard({
    /// Название фильма.
    required this.name,

    /// Сохранение фильма.
    required this.addFilm,

    /// Описание фильма.
    this.description,

    /// Рейтинг Кинопоиска.
    this.rating = 0,

    /// Год выпуска.
    this.year,
    super.key,
  });

  final String name;
  final String? description;
  final num? rating;
  final int? year;
  final VoidCallback addFilm;

  @override
  Widget build(BuildContext context) {
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
                    name,
                    maxLines: 2,
                    style: context.mBlack18(),
                  ),
                  Text(year.toString(), style: context.mBlack12()),
                  if (rating != null && rating! > 0) ...[
                    SizedBox(height: 5.a),
                    Row(
                      children: [
                        Text('КиноПоиск: ', style: context.mBlue12()),
                        Text(rating!.toStringAsFixed(1), style: context.mBlue14()),
                      ],
                    ),
                  ],
                  SizedBox(height: 10.a),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Text('Жанр:', style: context.mBlack14()),
                    ],
                  ),
                  SizedBox(height: 10.a),
                  Text(
                    description != null ? description! : '',
                    style: context.mBlack12(),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 10.a),
                  AppButton(
                    text: 'Сохранить',
                    onTap: addFilm,
                    color: context.theme.focusedBorderColor,
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
