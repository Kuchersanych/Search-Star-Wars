import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:search_star_warriors/domain/entity/star_warrior.dart';
import 'package:search_star_warriors/library/adaptive/adaptive.dart';
import 'package:search_star_warriors/library/scaffold_manager/scaffold_manager.dart';
import 'package:search_star_warriors/ui/common/refresh_indicators/scrollable_refresh_indicator_widget.dart';
import 'package:search_star_warriors/ui/pages/tabs/main/main_vm.dart';
import 'package:search_star_warriors/ui/pages/tabs/main/widgets/search_field.dart';
import 'package:search_star_warriors/ui/theme/app_padding.dart';
import 'package:search_star_warriors/ui/theme/src/theme_extension.dart';
import 'package:search_star_warriors/util/extensions/context_extensions.dart';

import 'widgets/star_warrior_card.dart';

class MainPage extends StatelessWidget {
  /// Пример описания виджета
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.select((MainVM value) => value.state);
    final model = context.read<MainVM>();

    final s = context.s;

    final List<StarWarrior> foundStarWarrior = state.foundStarWarrior;

    return ScaffoldManager(
      status: ScaffoldManagerStatus.loaded,
      body: ScrollableRefreshIndicatorWidget(
        onRefresh: () => model.getSearchResult(model.searchController.text),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppPadding.mainWidth),
          child: Column(
            children: [
              SizedBox(height: 50.a),
              Visibility(
                visible: state.foundStarWarrior.isNotEmpty,
                child: Text(
                  'Search Star Warriors',
                  style: context.mBlue24(fontSize: 30.a, fontWeight: FontWeight.w600),
                ),
              ),
              SearchField(
                controller: model.searchController,
              ),
              Column(
                  children: foundStarWarrior.isNotEmpty
                      ? foundStarWarrior
                          .map((item) =>


                      StarWarriorCard(
                        addWarrior: () => model.addStarWarrior(item),
                        name: item.name ?? '',
                        gender: item.gender ?? '',
                        starships: item.starships,

                      ),
                  )
                          .toList()
                      : [
                          SizedBox(height: 150.a),
                          Text('Search Star Warriors', style: context.mBlue24(fontSize: 35.a, fontWeight: FontWeight.w900)),
                          SizedBox(height: 25.a),
                          Center(
                            child: Text(s.typingHeroName),
                          ),
                        ],
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
