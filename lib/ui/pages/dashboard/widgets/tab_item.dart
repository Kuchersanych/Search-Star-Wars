import 'package:flutter/material.dart';

import 'src/data_tab_bar.dart';

class TabItem extends StatelessWidget {
  /// Иконка
  final ItemTabData itemData;

  /// Является ли выбранным
  final bool isSelected;

  /// Виджет Item
  const TabItem({
    super.key,
    required this.itemData,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(itemData.asset),
          Text(
            itemData.label,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
