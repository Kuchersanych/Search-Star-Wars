import 'package:flutter/cupertino.dart';
import 'package:search_star_warriors/library/adaptive/adaptive.dart';
import 'package:search_star_warriors/ui/common/title_widget.dart';
import 'package:search_star_warriors/ui/theme/app_padding.dart';
import 'package:search_star_warriors/util/extensions/context_extensions.dart';

class AddFileButtons extends StatelessWidget {
  /// Добавление нового файла
  const AddFileButtons({
    super.key,
    required this.camera,
    required this.gallery,
  });

  /// Добавления с камеры устройства
  final VoidCallback camera;

  /// Добавления из галлереи устройства
  final VoidCallback gallery;

  @override
  Widget build(BuildContext context) {
    final s = context.s;
    return Padding(
      padding: EdgeInsets.only(top: 25.a),
      child: Column(
        children: [
          TitleWidget(title: s.searchFilm),
          SizedBox(height: 10.a),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppPadding.mainWidth),
            child: Row(),
          ),
        ],
      ),
    );
  }
}
