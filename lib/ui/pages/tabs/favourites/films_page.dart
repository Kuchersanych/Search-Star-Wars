import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:search_star_warriors/domain/entity/star_warrior.dart';
import 'package:search_star_warriors/library/adaptive/adaptive.dart';
import 'package:search_star_warriors/library/scaffold_manager/scaffold_manager.dart';
import 'package:search_star_warriors/ui/common/expanded_single_child_scroll_view.dart';
import 'package:search_star_warriors/ui/pages/tabs/favourites/films_vm.dart';
import 'package:search_star_warriors/ui/pages/tabs/main/widgets/film_card.dart';
import 'package:search_star_warriors/ui/theme/app_padding.dart';
import 'package:search_star_warriors/ui/theme/src/theme_extension.dart';
import 'package:search_star_warriors/util/extensions/context_extensions.dart';

class FavouritesPage extends StatelessWidget {
  /// Пример описания виджета
  const FavouritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final s = context.s;
    final state = context.select((FavouritesVM value) => value.state);
    final model = context.read<FavouritesVM>();

    final List<StarWarrior> favorites = state.favorites;

    return ScaffoldManager(
      status: ScaffoldManagerStatus.loaded,
      body: ExpandedSingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppPadding.mainWidth),
          child: Column(
            children: [
              Visibility(
                visible: favorites.isNotEmpty,
                child: Text(
                  s.favourites,
                  style: context.mBlue24(fontSize: 30.a, fontWeight: FontWeight.w600),
                ),
              ),
              Column(
                  children: favorites.isNotEmpty
                      ? favorites
                          .map(
                            (item) => Text('Тут вернуть список фаворитов')



                            //     StarWarriorCard(
                            //   addFilm: () {},
                            //   name: item.name ?? '',
                            //   year: item.year,
                            //   rating: item.rating?.kp,
                            //   genres: item.genres,
                            //   description: item.description,
                            //   poster: item.poster?.url ?? '',
                            //   countries: item.countries ?? [],
                            // ),
                          )
                          .toList()
                      : [
                          SizedBox(height: 150.a),
                          Text('LOOK', style: context.mBlue24(fontSize: 80.a, fontWeight: FontWeight.w900)),
                          SizedBox(height: 25.a),
                          Center(
                            child: Text(s.donFilms),
                          ),
                        ]),
            ],
          ),
        ),
      ),
    );
  }
}
