// import 'package:animator/animator.dart';
// import 'package:flutter/material.dart';
//
// class AnimatedIcons<T> extends StatelessWidget {
//   const AnimatedIcons({
//     super.key,
//     this.tween,
//     required this.duration,
//     this.curve,
//     this.cycles,
//     this.repeats,
//     required this.resetAnimationOnRebuild,
//     this.triggerOnInit,
//     this.customListener,
//     this.endAnimationListener,
//     this.statusListener,
//     required this.builder,
//     this.child,
//     this.tweenMap,
//     this.animatorKey,
//   });
//
//   ///Линейная интерполяция между начальным и конечным значением.
//   ///
//   ///Аргумент `tween` используется для одной анимации Tween.
//   final Tween<T>? tween;
//
//   ///Промежуток времени, например 27 дней, 4 часа, 12 минут и 3 секунды.
//   final Duration duration;
//
//   ///Кривая замедления, т.е. отображение единичного интервала на единичный интервал.
//   final Curve? curve;
//
//   ///Количество прямых и обратных периодов анимации
//   ///выполняется перед остановкой
//   final int? cycles;
//
//   ///Количество периодов вперед, которые выполняет анимация перед остановкой
//   final int? repeats;
//
//   ///Сбрасываются ли настройки анимации при включении виджета Animator
//   /// перестроен. Значение по умолчанию неверно.
//   ///
//   ///Настройки анимации определяются аргументом анимации движения, продолжительностью и кривой.
//   final bool resetAnimationOnRebuild;
//
//   ///Запускать ли анимацию при виджете Animator
//   /// вставляется в дерево.
//   final bool? triggerOnInit;
//
//   ///Функция, которая будет вызываться каждый раз при изменении значения анимации.
//   ///
//   /// CustomListener снабжен объектом [Animation].
//   final void Function(AnimatorState<T>)? customListener;
//
//   ///VoidCallback будет вызываться после завершения анимации.
//   final void Function(AnimatorState<T>)? endAnimationListener;
//
//   ///Функция, которая будет вызываться каждый раз при изменении статуса анимации.
//   ///
//   /// CustomListener имеет [AnimationStatus, AnimationSetup]
//   ///объект.
//   final void Function(AnimationStatus, AnimatorState<T>)? statusListener;
//
//   ///Стратегия сборки, используемая в настоящее время для одного Tween. Обновление виджета аниматора
//   ///сам каждый раз, когда анимация меняет значение.
//   ///
//   ///Конструктору предоставляется объект [Анимация].
//   final Widget Function(
//     BuildContext context,
//     AnimatorState<T> animatorState,
//     Widget? child,
//   ) builder;
//
//   ///Виджет, который вы не хотите анимировать.
//   ///Это статическая часть анимированного виджета.
//   final Widget? child;
//
//   ///Линейная интерполяция между начальным и конечным значением.
//   ///
//   ///`tweenMap` аргумент используется для мульти-Tween-анимации.
//   final Map<String, Tween<dynamic>>? tweenMap;
//
//   final AnimatorKey<T>? animatorKey;
//
//   @override
//   Widget build(BuildContext context) {
//     return Animator<double>(
//       duration: duration,
//       cycles: cycles,
//       curve: curve,
//       tween: Tween<double>(begin: 20.0, end: 25.0),
//       builder: (context, animatorState, child) => builder(context, animatorState, child),
//     );
//   }
// }
