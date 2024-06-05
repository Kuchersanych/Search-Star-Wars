
import 'package:flutter/material.dart';

class IncrementButton extends StatelessWidget {

  /// Кнопка декрементирования
  const IncrementButton({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: const Icon(Icons.add),
    );
  }
}