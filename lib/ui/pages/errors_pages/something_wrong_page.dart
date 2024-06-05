import 'package:flutter/material.dart';

class SomethingWrongPage extends StatelessWidget {

  /// Экрна уведомления о некой ошибке
  const SomethingWrongPage({super.key, required this.msg});

  final String msg;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(msg),
      ),
    );
  }
}
