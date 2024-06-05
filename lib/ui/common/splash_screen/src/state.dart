part of '../splash.dart';

/// Состояние [Splash]
class SplashState {
  final double fontSize;
  final double containerSize;
  final double textOpacity;
  final double containerOpacity;

  SplashState({
    this.fontSize = 2,
    this.containerSize = 1.5,
    this.textOpacity = .0,
    this.containerOpacity = .0,
  });

  SplashState copyWith({
    double? fontSize,
    double? containerSize,
    double? textOpacity,
    double? containerOpacity,
  }) {
    return SplashState(
      fontSize: fontSize ?? this.fontSize,
      containerSize: containerSize ?? this.containerSize,
      textOpacity: textOpacity ?? this.textOpacity,
      containerOpacity: containerOpacity ?? this.containerOpacity,
    );
  }
}
