import 'package:search_star_warriors/library/adaptive/adaptive.dart';
import 'package:flutter/material.dart';

class Count extends StatelessWidget {
  /// Виджет счетчика
  const Count({
    super.key,
    required this.count,
  });

  final String count;

  @override
  Widget build(BuildContext context) {
    return Text(
      count,
      style: TextStyle(
        fontSize: 150.hA,
      ),
    );
  }
}
