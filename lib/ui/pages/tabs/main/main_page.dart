import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:search_star_warriors/domain/entity/star_warrior.dart';
import 'package:search_star_warriors/library/adaptive/adaptive.dart';
import 'package:search_star_warriors/ui/pages/tabs/main/main_vm.dart';
import 'package:search_star_warriors/ui/pages/tabs/main/widgets/search_field.dart';
import 'package:search_star_warriors/ui/theme/app_padding.dart';
import 'package:search_star_warriors/ui/theme/src/theme_extension.dart';
import 'package:search_star_warriors/util/extensions/context_extensions.dart';

import '../../../common/star_warrior_card.dart';

class MainPage extends StatelessWidget {
  /// Главный экран.
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.select((MainVM value) => value.state);
    final model = context.read<MainVM>();

    final s = context.s;

    final List<StarWarrior> foundStarWarrior = state.foundStarWarrior;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppPadding.mainWidth),
          child: Column(
            children: [
              SizedBox(height: 50.a),
              Visibility(
                visible: state.foundStarWarrior.isNotEmpty,
                child: Text(
                  s.searchStarWarriors,
                  style: context.mBlue24(fontSize: 30.a, fontWeight: FontWeight.w600),
                ),
              ),
              SearchField(
                controller: model.searchController,
              ),
              Column(
                children: foundStarWarrior.isNotEmpty
                    ? foundStarWarrior
                        .map(
                          (item) => StarWarriorCard(
                            addWarrior: () => model.addStarWarrior(item),
                            warrior: item,
                          ),
                        )
                        .toList()
                    : [
                        SizedBox(height: 150.a),
                        Text(s.searchStarWarriors,
                            style: context.mBlue24(fontSize: 35.a, fontWeight: FontWeight.w900)),
                        SizedBox(height: 25.a),
                        Center(child: Text(s.typingHeroName)),
                      ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
