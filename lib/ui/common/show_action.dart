import 'package:search_star_warriors/ui/theme/app_border_radius.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snackbar_plus/flutter_snackbar_plus.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:search_star_warriors/ui/theme/src/theme_extension.dart';

import '../theme/app_colors.dart';

abstract class ShowAction {

  /// Вызов [AlertDialog]
  static alertDialog({
    required BuildContext context,
    required Widget child,
  }) {
    showDialog(
      barrierColor: context.theme.scaffoldBackgroundColor.withOpacity(0.5),
      context: context,
      builder: (_) => child,
    );
  }

  /// Вызов [SnackBar]
  static void showSmartSnackBar({
    required BuildContext context,
    required String title,
    String? message,
    String? assetPath,
  }) {
    FlutterSnackBar.showTemplated(
      context,
      title: title,
      message: message,
      leading: assetPath != null
          ? Image.asset(assetPath)
          : const SizedBox.shrink(),
      style: FlutterSnackBarStyle(
        margin: const EdgeInsets.symmetric(horizontal: 70),
        radius: BorderRadius.circular(6),
        backgroundColor: context.theme.scaffoldBackgroundColor,
        shadow: BoxShadow(
          color: Colors.black.withOpacity(0.55),
          blurRadius: AppBorderRadius.radius10,
          offset: const Offset(0, 12),
          blurStyle: BlurStyle.normal,
        ),
        padding: const EdgeInsets.only(
          top: 15,
          bottom: 15,
          left: 30,
          right: 20,
        ),
        titleAlignment: TextAlign.center,
        messageAlignment: TextAlign.center,
      ),
      configuration: const FlutterSnackBarConfiguration(
        location: FlutterSnackBarLocation.bottom,
        distance: 30,
        animationCurve: Curves.ease,
        animationDuration: Duration(milliseconds: 500),
        showDuration: Duration(seconds: 3),
        persistent: false,
        dismissible: false,
        dismissDirection: DismissDirection.down,
        showLoadingBar: false,
      ),
    );
  }

  /// Вызов [BottomSheet]
  static modalBottomSheet({
    required Widget child,
    required BuildContext context,
    bool isScrollControlled = true,
    bool isAdaptiveHeight = false,
    bool useRootNavigator = false,
  }) {
    showModalBottomSheet(
      useRootNavigator: useRootNavigator,
      barrierColor: AppColorsLight.gray.withOpacity(0.5),
      elevation: 0,
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: isScrollControlled,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: isAdaptiveHeight ? Wrap(children: [child]) : child,
        );
      },
    );
  }

  /// Отобразить лоадер
  static OverlaySupportEntry show() => showOverlay(
        (_, progress) {
          return Opacity(
            opacity: progress,
            child: Material(
              color: AppColorsLight.white.withOpacity(.7),
              child: const FittedBox(
                fit: BoxFit.scaleDown,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          );
        },
        duration: Duration.zero,
      );
}
