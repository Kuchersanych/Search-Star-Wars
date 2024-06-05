library adaptive_tg;

import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../ui/app/app_vm.dart';

part 'src/helper.dart';
part 'src/adaptive_notifier.dart';
part 'src/extensions.dart';

typedef AdaptiveBuilder = Widget Function(BuildContext);

///
class Adaptive extends StatelessWidget {
  Adaptive({
    super.key,
    required this.builder,
    required AdaptiveState state,
  }) {
    _notifier = ValueNotifier(state);
  }

  ///
  final AdaptiveBuilder builder;

  @override
  Widget build(BuildContext context) {
    return AdaptiveNotifier.builder(
      builder: (state) {
        return LayoutBuilder(builder: (context, constraints) {
          return OrientationBuilder(builder: (context, orientation) {
            Device.setScreenSize(
              context,
              constraints,
              orientation,
              state.height,
              state.width,
            );

            if (constraints.maxWidth == 0 || constraints.maxHeight == 0) {
              return const SizedBox.shrink();
            }
            return builder(context);
          });
        });
      }
    );
  }
}
