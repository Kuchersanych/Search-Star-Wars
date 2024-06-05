import 'dart:async';

/// Класс с утилитами над [Stream]
mixin StreamUtils {
  /// Регистрация подписки на [stream]
  StreamSubscription subscribe<T>(
      Stream<T> stream,
      void Function(T t) onValue, {
        void Function(Object e)? onError,
        void Function()? afterSubscription,
      }) {
    final compositeSubscription = _CompositeSubscription();

    StreamSubscription subscription = stream.listen(
      onValue,
      onError: (e) {
        if (onError != null) {
          onError.call(e);
        }
      },
    );

    if(afterSubscription != null) {
      afterSubscription();
    }

    compositeSubscription.add(subscription);
    return subscription;
  }
}

class _CompositeSubscription {
  bool _isDisposed = false;

  final _subscriptionsList = <StreamSubscription<dynamic>>[];

  bool get isDisposed => _isDisposed;

  StreamSubscription<T> add<T>(StreamSubscription<T> subscription) {
    if (isDisposed) {
      throw ('This composite was disposed, try to use new instance instead');
    }
    _subscriptionsList.add(subscription);
    return subscription;
  }

  void remove(StreamSubscription<dynamic> subscription) {
    subscription.cancel();
    _subscriptionsList.remove(subscription);
  }

  void clear() {
    for (var subscription in _subscriptionsList) {
      subscription.cancel();
    }
    _subscriptionsList.clear();
  }

  void dispose() {
    clear();
    _isDisposed = true;
  }
}
