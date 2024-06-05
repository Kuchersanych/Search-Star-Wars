part of '../stock/stock_banner.dart';

class BonusBanner extends StatelessWidget {
  /// Баннер накопите юонусы
  const BonusBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final s = context.s;
    final GlobalKey<AnimatorWidgetState> rotateAnimation =
    GlobalKey<AnimatorWidgetState>();

    return BannerCard(
      colors: const [
        Color.fromRGBO(26, 201, 252, 1),
        Color.fromRGBO(29, 115, 241, 1),
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  s.pointsWatchingVideo,
                  style: context.white24w500(),
                ),
              ),
              BounceIn(
                preferences: AnimationPreferences(
                  offset: AppDuration.oneSecond,
                  animationStatusListener: (state) {
                    if(state == AnimationStatus.completed) {
                      rotateAnimation.currentState?.forward();
                    }
                  }
                ),
                child: RotateIn(
                  key: rotateAnimation,
                  child: Text(
                      "📸",
                    style: TextStyle(fontSize: 75.a),
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 15.a),
          AppButton(
            width: 100,
            text: s.watch,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

