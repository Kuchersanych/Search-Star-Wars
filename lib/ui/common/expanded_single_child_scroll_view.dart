import 'package:flutter/material.dart';

class ExpandedSingleChildScrollView extends StatelessWidget {
  /// Предоставляет возможнасть использовать потомков [Flex] в [child]
  const ExpandedSingleChildScrollView({
    super.key,
    required this.child,
    this.physics = const BouncingScrollPhysics(),
  });

  /// Дочерний виджет
  final Widget child;

  /// Применяемая физика скролла
  final ScrollPhysics? physics;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Form(
          child: SingleChildScrollView(
            physics: physics,
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: child,
              ),
            ),
          ),
        );
      },
    );
  }
}
