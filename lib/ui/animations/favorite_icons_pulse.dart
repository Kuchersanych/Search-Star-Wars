
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:search_star_warriors/library/adaptive/adaptive.dart';
import 'package:search_star_warriors/ui/theme/app_colors.dart';

class FavoriteIconsPulse extends StatelessWidget {

  /// Виджет пульсирующего сердца
  const FavoriteIconsPulse({super.key});

  @override
  Widget build(BuildContext context) {


    final GlobalKey<AnimatorWidgetState> rotateAnimation =
    GlobalKey<AnimatorWidgetState>();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Pulse(
        key: rotateAnimation,
        preferences: AnimationPreferences(
            animationStatusListener: (state) {
              if(state == AnimationStatus.completed) {
                rotateAnimation.currentState?.forward();
              }
            }
        ),
        child: Icon(
          Icons.favorite,
          color: AppColorsLight.red,
          size: 30.a,
        ),
      ),
    );
  }
}