import 'package:url_launcher/url_launcher.dart';

/// Расширения [String]
extension StringExtensions on String {

  /// Удаляет все символы, кроме чисел.
  String toOnlyNum() {
    return toString().replaceAll(RegExp(r"\D+"), '');
  }

  /// Реализация перенаправление в звонилку OS
  Future<void> phoneCall() async {
    try {
      final Uri launchUri = Uri(
        scheme: 'tel',
        path: toString(),
      );
      await launchUrl(launchUri);
    } catch (e) {}
  }
}
