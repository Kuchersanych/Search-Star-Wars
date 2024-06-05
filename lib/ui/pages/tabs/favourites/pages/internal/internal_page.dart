import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'internal_vm.dart';

class InternalPage extends StatelessWidget {

  /// Вложеный экран
  const InternalPage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterUI = context.select((InternalVM value) => value.state.counterUI);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Преданый аргумент:', style: TextStyle(fontSize: 30),),
            Text(counterUI, style: const TextStyle(fontSize: 150),),
          ],
        ),
      ),
    );
  }
}
