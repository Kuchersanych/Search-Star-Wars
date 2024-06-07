import 'dart:async';

import 'package:overlay_support/overlay_support.dart';
import 'package:search_star_warriors/ui/common/show_action.dart';
import 'package:search_star_warriors/ui/theme/app_durations.dart';

import 'exception_handler.dart';


/// Утилиты над [Future]
mixin FutureUtils {
  /// Выполняет переданую [future], по окончанию выполнения выполняет [onValue].
  /// Если произойдет исключение отработает [onError] или [catchErrorService].
  /// Если передать [isShowLoader] вызовится анимация загрузки, по выполнению, она завершится.
  Future<void> doFuture<T>({
    required Future<T> future,
    bool isShowLoader = false,
    void Function(T t)? onValue,
    void Function(Object, String? msg)? onError,
  }) async {
    OverlaySupportEntry? overlay;
    if (isShowLoader) {
      try{
        overlay = ShowAction.show();
      }catch(_){
        await Future.delayed(AppDuration.hundred);
        overlay = ShowAction.show();
      }
    }

    await future.then(onValue ?? (v) {}).catchError((e, trace) {
      if (onError != null) {
        final msg = ExceptionHandler.shellException(e, trace);
        onError.call(e, msg);
      } else {
        final msg = ExceptionHandler.shellException(e, trace);
        if(msg != null) {
        }
      }

      overlay?.dismiss();
    });

    if (overlay != null) {
      overlay.dismiss();
    }
  }

  /// Дождаться выполнения всех [futures], получить результат в виде [List]
  /// с данными либо ошибкой/ошибками
  Future<void> doFutures({
    required List<Future<dynamic>> futures,
    void Function(List<dynamic> t)? onValueEnd,
    bool isShowLoader = false,
  }) async{
    OverlaySupportEntry? overlay;
    if (isShowLoader) {
      overlay = ShowAction.show();
    }
    final list = List<Object>.filled(futures.length, '');
    final completer = Completer<List<Object>>.sync();

    void checkIfFilled() {
      if (!completer.isCompleted) {
        completer.complete(list);
      }
    }

    void onValue(int i, Object? value) {
      list[i] = value?? '';
      checkIfFilled();
    }

    void onError(int i, Object? error) {
      list[i] = error ?? '';
      checkIfFilled();
    }

    for (var i = 0; i < futures.length; i++) {
      await futures
          .elementAt(i)
          .then((res) => onValue(i, res))
          .catchError((Object e, StackTrace s) => onError(i, e));
    }

    if(onValueEnd != null) {
      onValueEnd(await completer.future);
    }

    if (overlay != null) {
      overlay.dismiss();
    }
  }
}
