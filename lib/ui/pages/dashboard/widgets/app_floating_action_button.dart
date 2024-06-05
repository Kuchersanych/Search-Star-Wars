import 'package:flutter/material.dart';
import 'package:search_star_warriors/library/adaptive/adaptive.dart';
import 'package:search_star_warriors/ui/common/app_ink_well.dart';
import 'package:search_star_warriors/ui/common/buttons/app_gradient_button/app_gradient_button.dart';
import 'package:search_star_warriors/ui/theme/app_border_radius.dart';
import 'package:search_star_warriors/ui/theme/src/theme_extension.dart';

class AppFloatingActionButton extends StatelessWidget {
  /// Кастомный виджет [FloatingActionButton]
  const AppFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppInkWell(
      borderRadius: BorderRadius.circular(AppBorderRadius.radius10),
      onTap: () {},
      child: AppGradientButton(
        stateButton: StateButton.loading,
        height: 50.a,
        width: 50.a,
        onTap: () {  },
        child: Icon(
          Icons.add,
          color: context.theme.scaffoldBackgroundColor,
        ),
      ),
    );
  }
}
