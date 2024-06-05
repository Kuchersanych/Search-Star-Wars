import 'package:flutter/material.dart';
import 'package:search_star_warriors/library/adaptive/adaptive.dart';
import 'package:search_star_warriors/ui/theme/app_border_radius.dart';
import 'package:search_star_warriors/ui/theme/app_padding.dart';
import 'package:search_star_warriors/ui/theme/src/theme_extension.dart';

class AppCard extends StatelessWidget {
  const AppCard({
    required this.child,
    this.decoration,
    this.height,
    super.key});

  final Widget child;
  final Decoration? decoration;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      margin: EdgeInsets.symmetric(
        vertical: 5.a,
      ),
      decoration: decoration ?? BoxDecoration(
        color: context.theme.scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(AppBorderRadius.radius12),
        boxShadow: [
          BoxShadow(
            color: context.theme.shadowColor,
            spreadRadius: 0,
            blurRadius: 8.a,
            offset: Offset(0, 2.a), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppPadding.mainWidth.a),
        child: child,

      ),
    );
  }
}
