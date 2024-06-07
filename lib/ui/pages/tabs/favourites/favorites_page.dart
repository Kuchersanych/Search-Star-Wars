import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:search_star_warriors/domain/entity/star_warrior.dart';
import 'package:search_star_warriors/library/adaptive/adaptive.dart';
import 'package:search_star_warriors/ui/pages/tabs/favourites/favorites_vm.dart';
import 'package:search_star_warriors/ui/common/star_warrior_card.dart';
import 'package:search_star_warriors/ui/theme/app_padding.dart';
import 'package:search_star_warriors/ui/theme/src/theme_extension.dart';
import 'package:search_star_warriors/util/extensions/context_extensions.dart';

class FavouritesPage extends StatelessWidget {
  /// Экран "Избранное".
  const FavouritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final s = context.s;
    final state = context.select((FavouritesVM value) => value.state);

    final List<StarWarrior> favorites = state.favorites;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppPadding.mainWidth),
          child: Column(
            children: [
              SizedBox(height: 50.a),
              if(favorites.isNotEmpty)
              Text(
                s.favourites,
                style: context.mBlue24(fontSize: 30.a, fontWeight: FontWeight.w600),
              ),
              Column(
                  children: favorites.isNotEmpty
                      ? favorites
                          .map(
                            (item) => StarWarriorCard(
                              addWarrior: () {},
                              warrior: item,
                             isShowButtonSave: false,
                            ),
                          )
                          .toList()
                      : [
                        SizedBox(height: 150.a),
                          Center(
                            child: Text(s.donHero),
                          ),
                        ]),
            ],
          ),
        ),
      ),
    );
  }
}
