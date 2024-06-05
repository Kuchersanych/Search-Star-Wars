import 'package:flutter/material.dart';

class DecrementButton extends StatelessWidget {

  /// Кнопка инкрементирования
  const DecrementButton({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: const Icon(Icons.remove),
    );
  }
}