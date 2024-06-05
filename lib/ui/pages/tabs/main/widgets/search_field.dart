import 'package:flutter/material.dart';
import 'package:search_star_warriors/library/adaptive/adaptive.dart';
import 'package:search_star_warriors/ui/common/text_fields/search_text_field.dart';
import 'package:search_star_warriors/ui/theme/app_padding.dart';
import 'package:search_star_warriors/util/extensions/context_extensions.dart';

///  Поле поиска.
class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final s = context.s;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppPadding.mainWidth, vertical: 15.a),
      child: SearchTextField(
        controller: controller,
        hintText: s.search,
      ),
    );
  }
}
